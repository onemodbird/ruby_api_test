class RealtimeService
  class << self
    def enabled?
      @enabled ||= Secrets.pusher.present?
    end

    def publish(models, event_name, is_private, payload, async: true)
      return unless enabled?
      models = [models].flatten

      raise "Must publish to at least one channel" if models.empty?

      channels = models.map do |model|
        channel_name(model, is_private)
      end

      if async
        PusherTriggerJob.perform_async(channels, event_name.to_s, payload)
      else
        Pusher.trigger(channels, event_name.to_s, payload)
      end
    end

    def authenticate(channel_name, params)
      return unless enabled?
      raise "Socket id not specified" unless params[:socket_id]
      Pusher[channel_name].authenticate(params[:socket_id], params[:custom_data])
    end

    def is_model?(channel_name)
      channel_name.split("-", 4)[1] == "m"
    end

    def model_for(channel_name)
      raise "Channel #{channel_name} does't represent a model" unless is_model?(channel_name)

      model_name, id = channel_name.split("-", 4).last(2)
      model_name.singularize.capitalize.constantize.find(id)
    end

    # Gets a channel name for the model, channel names will follow
    # the format:
    #   "private-m-collection-6afa87a5-7a9a-43d9-8e97-f2d382d37cf5"
    #
    # private/private - denoting visibility
    # m/? - type of channel, m=model
    # class_name - name of class for channel
    # id - the remainder of the channel name, the model id
    def channel_name(model, is_private = false)
      visibility = is_private ? "private" : "public"
      class_name = model.class.name.demodulize.downcase

      [visibility, "m", class_name, model.id].compact.join("-")
    end
  end
end
