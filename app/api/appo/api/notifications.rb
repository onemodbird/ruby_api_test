module Appo
  module Api
    class Notifications < Grape::API

      helpers do
        def update_notifications(notification_ids, acknowledged)
          # Use .find for 404s & authorize! for 403s
          Notification.find(Array(notification_ids)).each do |notification|
            authorize! :update, notification
          end

          Notification
            .where(id: notification_ids)
            .update_all(acknowledged: acknowledged)
        end
      end

      resources :notifications do

        desc "List Notifications"
        route_setting :track, event: :notifications_list
        params do
          optional :page, type: Integer, default: 1
          optional :per, type: Integer, default: 20, values: 1..100
        end
        get do
          authorize! :read, Notification

          notifications =
            Notification
            .where(user_id: current_user.id)
            .order(created_at: :desc)
            .page(p.page)
            .per(p.per)

          pagination = {
            total: notifications.total_pages,
            current: p.page.to_i
          }

          unacknowledged = current_user.notifications.where(acknowledged: false).count

          { notifications: serialize(notifications), pagination: pagination, unacknowledged: unacknowledged }
        end

        desc "Update multiple notifications"
        route_setting :track, event: :notification_update, data: :ids
        params do
          requires :ids, type: Array
          requires :acknowledged, type: Boolean
        end
        put do
          update_notifications p[:ids], p[:acknowledged]
          body false
        end

        desc "Update all notifications"
        route_setting :track, event: :notification_update_all
        params do
          requires :acknowledged, type: Boolean
        end
        put "all" do
          current_user.notifications.update_all acknowledged: p[:acknowledged]
          body false
        end

        route_param :id do
          desc "Update a notification"
          route_setting :track, event: :notification_update, data: :id
          params do
            requires :id, type: String
            requires :acknowledged, type: Boolean
          end
          put do
            update_notifications p[:id], p[:acknowledged]
            body false
          end
        end

      end

    end
  end
end
