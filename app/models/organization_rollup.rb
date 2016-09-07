class OrganizationRollup
  class << self
    def rollup(ids)
      if ids.is_a? ActiveRecord::Relation
        ids = ids.pluck(:id)
      end

      sql = rollup_sql(ids.flatten.map{ |id| "'#{id}'" }.join(","))

      ActiveRecord::Base.connection.exec_query(sql).inject({}) do |hash, data|
        hash[data["id"]] = data
        hash
      end
    end

    def rollup_sql(organization_ids)
      %(with
        #{orgs(organization_ids)},
        #{schools},
        #{learners},
        #{learner_badges},
        #{assigned_resources}
        select
          id,
          (select count(1) from schools where parent_id = orgs.id) "school_count",
          (select count(1) from learners where parent_id = orgs.id) "learner_count",
          (select count(1) from learner_badges where parent_id = orgs.id) "badge_assertions_count",
          (select count(1) from assigned_resources where parent_id = orgs.id) "resource_assignments_count"
        from orgs
        group by orgs.id)
    end

    # -----------------------
    # Common table expresions
    # -----------------------
    def orgs(organization_ids)
      %(orgs as (
        select *
        from organizations
        where id in (#{organization_ids})
      ))
    end

    def schools
      %(schools as (
        select organizations.state_id "parent_id", organizations.*
          from organizations join orgs on
            organizations.state_id = orgs.id and
            organizations.type = 'School'

        union all

        select organizations.district_id "parent_id", organizations.*
          from organizations join orgs on
            organizations.district_id = orgs.id and
            organizations.type = 'School'

        union all

        select orgs.id "parent_id", orgs.*
          from orgs
          where orgs.type = 'School'
      ))
    end

    def learners
      %(learners as (
        select parent_id, organization_users.*
          from schools join organization_users
            on schools.id = organization_id
        where role = 'learner'
      ))
    end

    def learner_badges
      %(learner_badges as (
        select parent_id, badge_assertions.*
          from learners join badge_assertions
            on learners.user_id = badge_assertions.user_id
      ))
    end

    def assigned_resources
      %(assigned_resources as (
        select parent_id, assignments.assignable_id "resource_id"
          from learners join assignments
            on learners.user_id = assignments.user_id
            and assignable_type = 'Resource'

        union all

        select parent_id, collection_resources.resource_id
          from learners join assignments
            on learners.user_id = assignments.user_id
            and assignable_type = 'Collection'
          join collection_resources on collection_id = assignable_id
      ))
    end
  end
end
