class BlacklistedChatHostname
  class << self
    def all
      KeyValue.blacklisted_chat_hostnames.value
    end

    def add(hostnames)
      KeyValue.transaction do
        kv = KeyValue.blacklisted_chat_hostnames
        kv.value = kv.value | [hostnames].flatten
        kv.save!
      end
    end

    def delete(hostname)
      KeyValue.transaction do
        kv = KeyValue.blacklisted_chat_hostnames
        kv.value.delete(hostname)
        kv.save!
      end
    end
  end
end
