module Appo
  module Api
    class Subscriptions < Grape::API
      resource "subscriptions" do
        after_validation do
          require_user!
        end

        params do
          requires :type, type: String, values: Subscribable.allowed_type_names
        end
        desc "List subscriptions"
        route_setting :track, event: :subsciption_list, data: :type
        get "/" do
          subscriptions = current_user.subscriptions.where(
            subscribable_type: p.type.capitalize)

          { subscriptions: serialize(subscriptions) }
        end

        params do
          Subscribable.allowed_type_ids.each do |type_id|
            optional type_id
          end

          exactly_one_of *Subscribable.allowed_type_ids
        end
        group do
          desc "Subscribe to subscribable"
          route_setting :track, event: :subscribe, data: Subscribable.allowed_type_ids
          post do
            subscribable = Subscribable.find_by_params(p)
            subscribable.subscribe(current_user.id)
            { success: true }
          end

          desc "Unsubscribe from subscribable"
          route_setting :track, event: :unsubscribe, data: Subscribable.allowed_type_ids
          delete do
            subscribable = Subscribable.find_by_params(p)
            subscribable.unsubscribe(current_user.id)
            body false
          end
        end
      end
    end
  end
end
