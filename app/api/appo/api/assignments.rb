module Appo
  module Api
    class Assignments < Grape::API
      resource :assignments do
        before_validation do
          require_user!
        end

        desc "View all assignments"
        params do
          optional :user_id, type: String
          optional :organization_id, type: String
          exactly_one_of :user_id, :organization_id
        end
        route_setting :track, event: :assignment_list
        get do
          if p.organization_id.present?
            organization = Organization.find(p.organization_id)
            authorize! :manage, organization

            organization.assignments.with_includes
          else
            user = User.find(p.user_id)
            authorize! :assign, user

            user.assignments.with_includes.sort_by{ |assignment| assignment.assignable.name }
          end
        end

        desc "Create an assignment"
        params do
          requires :user_id, type: String, allow_blank: false
          requires :assignable_type, type: String
          requires :assignable_id, type: String
        end
        route_setting :track, event: :assignment_create, data: [:assignable_type, :assignable_id]
        post do
          raise_outside_of_dev!

          assignment = Assignment.find_or_initialize_by(
            user_id: p.user_id,
            assignable_type: p.assignable_type.capitalize,
            assignable_id: p.assignable_id)

          authorize! :create, assignment
          assignment.tap(&:save!)
        end

        desc "View a resource assignment"
        params do
          requires :resource_id, type: String
        end
        route_setting :track, event: :assignment_view, data: [:resource_id]
        get "resource/:resource_id", serializer: AssignmentWithDetailSerializer do
          resource = Resource.find(p.resource_id)
          assignment = resource.assignment_for(current_user)

          error!({ error: "Unauthorized" }, 403) unless assignment

          render assignment, { meta: { resource: resource }}
        end

        route_param :id do
          desc "Delete an assignment"
          params do
            requires :id, type: String
          end
          route_setting :track, event: :assignment_delete, data: :id
          delete do
            assignment = Assignment.find(p.id)
            authorize! :destroy, assignment

            assignment.destroy
          end

          desc "Create a new task for an assigned resource"
          params do
            requires :id, type: String
            requires :resource_id, type: String
            requires :task, type: Hash do
              requires :interaction, type: String
              requires :kind, type: String, values: AssignmentDetailTask::KINDS
              optional :data, type: Hash
            end
          end

          route_setting :track, event: :assignment_task, data: [:resource_id, "task.kind", "task.interaction"]
          post "tasks" do
            assignment = Assignment.find(p.id)
            authorize! :read, assignment

            detail = assignment.detail_for_resource(p.resource_id)
            task = detail.add_task current_user, p.task.interaction, p.task.kind, p.task.data
            detail.interaction_complete_task(p.task.interaction) || task
          end

        end
      end
    end
  end
end
