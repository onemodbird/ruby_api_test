module Appo
  module Api
    class Badges < Grape::API

      resource :badges do
        route_param :id do

          desc "View badge (and include badge assertion info if user has earned it)"
          params do
            requires :id, type: String
          end
          route_setting :track, event: :badge, data: [:id, :badge_assertion_id]
          get do
            badge = Badge.find(p.id)
            badge_assertion = current_user ?
              BadgeAssertion.where(user_id: current_user.id, badge_id: p.id).first :
              nil

            BadgeDetailSerializer.serialize(badge, badge_assertion)
          end

        end
      end
    end
  end
end
