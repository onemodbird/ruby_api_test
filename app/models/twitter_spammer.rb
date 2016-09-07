class TwitterSpammer
  class << self
    def all
      Rails.cache.fetch("twitter_spammers", expires_in: 1.day) do
        KeyValue.twitter_spammers.value
      end
    end

    def add(twitter_id)
      KeyValue.transaction do
        kv = KeyValue.twitter_spammers
        kv.value = kv.value | [twitter_id].flatten.map(&:to_s)
        kv.save!

        Rails.cache.delete("twitter_spammers")
      end
    end

    def delete(twitter_id)
      KeyValue.transaction do
        kv = KeyValue.twitter_spammers
        kv.value.delete(twitter_id.to_s)
        kv.save!

        Rails.cache.delete("twitter_spammers")
      end
    end
  end
end
