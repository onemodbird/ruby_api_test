class ResourceUpdateManagerJob
  include Sidekiq::Worker

  LIMIT = 500

  # Args passed in via args element in sidekiq-cron schedule
  def perform(args)
    args.symbolize_keys!

    resource_type = args[:resource_type].to_sym
    interval = args[:interval]
    skip_defunct = args[:skip_defunct]

    unless ResourceUpdateJob.updatable_types.include? resource_type.to_sym
      raise "Resource type #{resource_type} is not updatable"
    end

    resources = resources_to_update(resource_type, interval, skip_defunct)

    resources.update_all(
      "update_queued_at = resources.update_queued_at + interval '1 day'"
    )

    resources.pluck(:id).each do |resource_id|
      ResourceUpdateJob.perform_async(resource_id)
    end
  end

  def resources_to_update(resource_type, interval, skip_defunct)
    resources = Resource
      .where("update_queued_at < ?", Time.now - interval)
      .where(kind: resource_type)

    if skip_defunct
      resources = resources.where(defunct_at: nil)
    end

    resources.limit(LIMIT)
  end
end

