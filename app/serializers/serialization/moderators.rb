module Serialization
  module Moderators
    extend ActiveSupport::Concern
    included do

      def moderators
        object.moderators.map do |handle, data|
          user = User.where(twitter_id: data["id"].to_s).first

          {
            twitter_handle: handle,
            twitter_profile_image_url: data["twitter_profile_image_url"],
            user: user ? UserSimpleSerializer.new(user, scope: scope).serializable_hash : nil
          }
        end
      end

    end
  end
end
