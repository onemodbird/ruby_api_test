module Appo
  module Api
    class ChangeLogs < Grape::API
      desc "View all change logs"
      get ":change_loggable_type/:change_loggable_id/change_logs" do
        change_loggable = ChangeLoggable.find(
          params[:change_loggable_type],
          params[:change_loggable_id])

        authorize! :update, change_loggable

        # TODO: Revisit when a secondary change loggable type is added
        CollectionChangeLogSerializer.new(change_loggable)
      end
    end
  end
end
