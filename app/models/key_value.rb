class KeyValue < ActiveRecord::Base

  def self.collection_groups
    find_or_create_by!(key: 'collection_groups') do |key_value|
      key_value.value = [
        ['featured', []],
        ['hidden', []]
      ]
    end
  end

  def self.suggested_searches
    find_or_create_by!(key: 'suggested_searches') do |suggested_searches|
      suggested_searches.value = [
        '7th grade algebra',
        'Elementary school math',
        'Spelling'
      ]
    end
  end

  def self.blacklisted_chat_hostnames
    find_or_create_by!(key: "blacklisted_chat_hostnames") do |kv|
      kv.value = ["clickbank.net"]
    end
  end

  def self.twitter_spammers
    find_or_create_by!(key: "twitter_spammers") do |kv|
      kv.value = [
        "717276044672110592", # @CompareEduCost
      ]
    end
  end

  def self.elasticsearch_index_counters
    find_or_create_by!(key: "elasticsearch_index_counters") do |o|
      o.value = {}
    end
  end

  def self.imported_collections
    find_or_create_by!(key: 'imported_collections') do |o|
      o.value = {}
    end
  end

  def self.deleted_duplicate_review_ids
    find_or_create_by!(key: 'deleted_duplicate_review_ids') do |o|
      o.value = []
    end
  end

  def self.metrics
    find_or_create_by!(key: 'metrics') do |o|
      o.value = []
    end
  end

end
