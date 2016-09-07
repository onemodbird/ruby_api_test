class Appo::Utils::UserMerger
  MAPPINGS = {
    article: [:user_id],
    bookmark: [:user_id],
    change_log: [:user_id],
    collaboration: [:user_id, :collaborator_id],
    collection_group: [:user_id],
    collection_resource: [:user_id],
    collection: [:user_id],
    comment: [:user_id],
    resource: [:user_id],
    review: [:user_id],
    subscription: [:user_id],
    uploaded_file: [:user_id],
    chat_message: [:user_id]
  }

  MERGE_ATTRIBUTES = [:google_id, :twitter_id, :facebook_id]
  LATEST_MIGRATION_CHECK = 20151119225415

  def initialize(from:, to:, override_check: false)
    @from = User.find(from)
    @to = User.find(to)

    check_expert_merge!
    check_migrations! unless override_check == true
  end

  def check_expert_merge!
    if @from.roles.include?("expert") and !@to.roles.include?("expert")
      raise "Cannot merge from #{@from.name} (#{@from.id}) - user is an expert"
    end
  end

  def check_migrations!
    if ActiveRecord::Migrator.current_version < LATEST_MIGRATION_CHECK
      msg = "Later migrations have been applied that aren't accounted for in this user migrator.\n"
      msg += "The latest migration noted is #{LATEST_MIGRATION_CHECK}.\n\n"
      msg += "You can chose to ignore this and run anyway by initializing with a override_check: true"
      raise msg
    end
  end

  def merge!
    User.transaction do
      reassign_models
      reassign_jsonb_resource_reviews
      merge_user
    end
  end

  private

  def reassign_models
    MAPPINGS.each do |model_key, fields|
      clazz = model_key.to_s.camelize.constantize

      fields.each do |field|
        clazz.where(field => @from.id).update_all(field => @to.id)
      end
    end
  end

  def merge_user
    @to.merged_users << @from.attributes

    MERGE_ATTRIBUTES.each do |attribute|
      @to[attribute] = @from[attribute] unless @to[attribute].present?
    end

    @from.delete
    @to.save!
  end

  def reassign_jsonb_resource_reviews
    Resource.reviewed_by_user_id(@from.id).each do |resource|
      resource.reviews.each_with_index do |review, i|
        if review.fetch("user_id") == @from.id
          resource.reviews[i]["user_id"] = @to.id
        end
      end
      resource.save! if resource.changed?
    end
  end

end
