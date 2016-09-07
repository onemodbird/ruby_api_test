class CollectionChangeLogSerializer < BaseSerializer
  attributes :id, :change_logs

  def change_logs
    object.change_logs.includes(:associated, :user).order(:created_at).map do |change_log|
      hash = serialize_with_user(change_log, ChangeLogSerializer)

      if change_log.associated.present?
        hash.merge!(resource: ResourceSimpleSerializer.new(change_log.associated))
      end

      hash
    end
  end
end
