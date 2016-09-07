module Appo
  module Api
    class Organizations < Grape::API
      resource :organizations do
        before_validation do
          require_user!
        end

        desc "List the root organizations I have access to"
        route_setting :track, event: :root_organizations
        get "root" do
          require_vifadmin!
          OrganizationMetricsSerializer.list(Organization.passport_whole_schools)
        end

        route_param :id do
          desc "Get an organization"
          params do
            requires :id, type: String
          end
          route_setting :track, event: :organization_list
          get do
            organization = Organization.find(p.id)
            authorize! :manage, organization

            organization
          end

          desc "Get metrics for an organization"
          params do
            requires :id, type: String
            optional :include_learners, type: Boolean, default: false
          end
          route_setting :track, event: :organization_metrics
          get "metrics" do
            if Demo::VifDemoUser.intercept?(current_user)
              return Demo::VifDemoUser.metrics(p.id)
            else
              organization = Organization.find(p.id)
              authorize! :manage, organization

              OrganizationMetricsSerializer.serialize(
                organization, learners: p.include_learners)
            end
          end
        end
      end
    end
  end
end
