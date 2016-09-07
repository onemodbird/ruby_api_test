module Appo
  module Api
    class Dashboard < Grape::API

      route_setting :track, event: :dashboard_view

      get :dashboard do
        authorize! :read, :dashboard
        DashboardSerializer.new(current_user)
      end

    end
  end
end
