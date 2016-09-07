module Appo
  module Api
    class BadgeAssertions < Grape::API
      resource :badge_assertions do

        desc "View earned badges for a user"
        params do
          requires :user_id, type: String
        end
        route_setting :track, event: :badge_assertion_list, data: [:user_id]
        get do
          user = User.find(p.user_id)
          assertions = user.badge_assertions

          {
            user: UserSimpleSerializer.serialize(user),
            badge_assertions: BadgeAssertionSerializer.list(assertions)
          }
        end

      end
    end
  end
end
