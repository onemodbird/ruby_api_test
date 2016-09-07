class UserSerializer < BaseSerializer

  attributes :id, :name, :email, :email_confirmed, :lede, :bio,
             :profile_photo_url, :expert, :created_at,
             :twitter_username, :google_profile_id, :external_profile_url_1,
             :external_profile_url_2, :reviews, :email_notifications,
             :unread_notifications, :expertise_tags, :grade_levels, :subscribed,
             :permissions

  has_many :collections, serializer: CollectionPreviewSerializer
  has_many :badge_assertions

  # Remove private attributes for public viewing
  def filter(keys)
    if can?(:update, object)
      keys
    else
      keys - [:email, :email_confirmed, :email_notifications, :unread_notifications]
    end
  end

  def email_confirmed
    object.confirmed_at.present?
  end

  def reviews
    @reviews ||= reviewed_resources.map do |rsrc|
      rsrc = rsrc.dup
      rvw = rsrc.delete('review')
      rvw = rvw.dup
      rvw['resource'] = rsrc
      rvw
    end
  end

  # TODO: Consolodate this with reviews method
  def reviewed_resources
    @reviewed_resources ||= Review.where(user_id: object.id)
     .order(updated_at: :desc)
     .limit(10)
     .pluck(:resource_id)
     .map{ |resource_id|
       r = Appo::Formatters::Resource.format(
         Resource.get(resource_id)
       )

       reviews = r.delete('reviews')
       review = reviews.find{ |r|
         r.fetch('reviewer').fetch('id') == object.id
       }
       review.delete('reviewer')

       r['review'] = review
       r
     }
  end

  def collections
    public_only = !can?(:update, object)
    @collections ||= object.editable_collections(public_only).limit(12)
  end

  def created_at
    object.created_at.to_i
  end

  def email_notifications
    !object.disabled_communication.include? "all"
  end

  def unread_notifications
    object.notifications.unread.count
  end
end
