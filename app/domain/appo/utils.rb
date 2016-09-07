module Appo
  module Utils

    def self.console_user
      User.find_or_create_by!(email: 'console@participate.com') do |u|
        u.password = SecureRandom.hex
        u.name = 'Console User'
      end
    end

    def self.lock_all_inactive_non_appo_accounts
      User.find_each do |user|
        next if user.access_locked?
        next if user.active?
        next if user.email.ends_with?('@appolicious.com')
        user.update_attributes!(locked_at: Time.zone.now)
      end
    end

    def self.remove_blank_tags_and_common_core_tags
      Resource.find_each do |resource|
        resource.send(:reject_blank_tags)
        resource.save! if resource.changed?
      end
    end

    def self.migrate_subject_and_topic_tags_to_tags
      Resource.find_each do |resource|
        Resource.transaction do
          resource.reload
          lower_tags = resource.tags.map(&:downcase)
          (resource.subject_tags + resource.topic_tags).each do |tag|
            if !lower_tags.include?(tag.downcase)
              resource.tags << tag
            end
          end
          if resource.changed?
            resource.save!
          end
        end
      end
      Resource.reindex!
    end

    def self.remove_duplicate_reviews
      deleted_ids = KeyValue.deleted_duplicate_review_ids

      Resource.find_each do |resource|
        next if resource.reviews.empty?
        deleted_ids.value += remove_duplicate_reviews_for_resource(resource)
        deleted_ids.save!
      end

      deleted_ids.value.size
    end

    def self.remove_duplicate_reviews_for_resource resource
      groups = resource.reviews.group_by{ |r|
        Digest::MD5.hexdigest([
          r.fetch('user_id'),
          r.fetch('content_score'),
          r.fetch('feature_score'),
          r.fetch('engagement_score'),
          r.fetch('comment')
        ].map(&:to_s).join)
      }

      duplicates = groups.values
                          .select{|group| group.size > 1 }
                          .flat_map{|group| group.drop(1) }

      duplicates.each do |d|
        review = Review.find(d.fetch('id'))
        Appo::Transactors::ReviewDestroyer.new(resource, review).destroy!
      end

      duplicates.map{|d| d.fetch('id')}
    end

    def self.ensure_reviews_expert_flag_is_set
      Review.connection.execute <<-SQL
        UPDATE reviews
        SET expert = true
        FROM users
        WHERE reviews.user_id = users.id
        AND users.roles @> '["expert"]'
      SQL

      resource_ids =
        Resource
          .where('jsonb_array_length(reviews) > 0')
          .pluck(:id)

      resource_ids.each_slice(10) do |ids|
        Review.transaction do
          ids.each do |id|
            resource = Resource.find(id)
            next if resource.reviews.all? { |r| r.has_key?('expert') }
            review_ids = resource.reviews.map { |r| r.fetch('id') }
            reviews = Review.find(review_ids)
            reviews.sort_by! { |r| review_ids.index(r.id) }
            resource.update_attribute(:reviews, reviews.map(&:attributes)) || raise
          end
        end
      end
    end

    def self.normalize_user_data
      User.find_each(batch_size: 1) do |user|
        user.send(:normalize_data)
        user.save! if user.changed?
      end
    end
  end
end
