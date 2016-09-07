class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[-a-z0-9_+'\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  ROLES = ["expert", "content_creator"]

  include Searchable
  include Linkable
  include Subscribable

  attr_accessor :email_notifications

  belongs_to :collaboration

  validates :email, format: EMAIL_REGEX, allow_nil: true
  validate :validate_grade_levels

  def validate_grade_levels
    if grade_levels.detect{ |grade_level| !Appo::ResourceTags::GRADES.include? grade_level }
      errors.add(:grade_levels, :invalid)
    end
  end

  mount_uploader :avatar, AvatarUploader

  has_many :chat_messages
  has_many :collections
  has_many :subscriptions
  has_many :notifications
  has_many :bookmarks
  has_many :scheduled_messages
  has_many :assignments
  has_many :assignment_details
  has_many :assignment_detail_tasks
  has_many :organization_users
  has_many :badge_assertions
  has_many :organizations, through: :organization_users
  has_many :badges, through: :badge_assertions
  has_many :resources

  before_create :update_auth_token!
  before_save :normalize_data
  before_save :maintain_expertise_tags
  before_save :update_notifications
  before_save :request_reconfirmation_if_email_changed
  after_create :assign_preview_collections
  after_commit :reindex_embedded_user_data, on: :update

  INDEX_COUNTER = 3
  settings ::Searchable::SETTINGS do
    mappings do
      indexes :name,
        type: "string",
        fields: {
          name_autocomplete: {
            type: "string",
            analyzer: "autocomplete",
            search_analyzer: "standard"
          },
          name_sort: {
            type: "string",
            analyzer: "lowercase_keyword"
          }
        }
      indexes :bio, type: "string", index: "not_analyzed"
      indexes :profile_photo_url, type: "string", index: "not_analyzed"
      indexes :twitter_username, type: "string", index: "not_analyzed"
      indexes :google_profile_id, type: "string", index: "not_analyzed"
      indexes :external_profile_url_1, type: "string", index: "not_analyzed"
      indexes :external_profile_url_2, type: "string", index: "not_analyzed"
      indexes :expert, type: "boolean"
      indexes :expertise_tags, type: "string", analyzer: "lowercase_keyword"
    end
  end

  INDEXED_FIELDS = %w(
    id
    visible
    name
    lede
    email
    bio
    profile_photo_url
    twitter_username
    google_profile_id
    external_profile_url_1
    external_profile_url_2
    expert
    expertise_tags
  )

  def as_indexed_json(options={})
    {}.tap do |h|
      INDEXED_FIELDS.each do |field|
        h.store(field, self.send(field))
      end
    end
  end


  devise(*[
    :database_authenticatable,
    :lockable,
    :rememberable,
    :timeoutable,
    :trackable,
    :validatable,
    :registerable,
    :confirmable,
    :recoverable
  ])
  include ViflearnPasswordSupport

  VifUserData = Struct.new(
    :district,
    :school,
    :email,
    :first_name,
    :last_name,
    :collection_names
  ) do
    def name
      "#{first_name} #{last_name}".strip
    end
  end

  scope :recent, -> { order(created_at: :desc) }

<<<<<<< HEAD
  def self.vif(greenprintmedia_user_id)
    User.find_by(greenprintmedia_user_id: greenprintmedia_user_id)
=======
  def self.vif(viflearn_user_id)
    User.find_by(viflearn_user_id: viflearn_user_id)
>>>>>>> parent of 0bd3464... customize to greenprintmedia
  end

  def self.try_vif_create(vif_user_data)
    raise "Only in development!" unless Rails.env.development?
    User.transaction do
      vif_create(vif_user_data)
      raise ActiveRecord::Rollback
    end
  end

  def self.vif_create(vif_user_data)
    return false if User.find_by(email: vif_user_data.email)

    transaction do
      cet = false

      user = User.new(email: vif_user_data.email, name: vif_user_data.name)
      user.password = SecureRandom.hex
      user.confirmed_at = Time.now.utc
      user.flags["cet"] = cet
      user.flags["post_import_vif_user"] = true

      if !user.save
        puts "User could not be created: #{user.email}"
        raise ActiveRecord::Rollback
      end

      district = nil
      districts =
        Organization
          .where(type:"District", name: vif_user_data.district).load

      if districts.size < 1
        puts "No district found: #{user.email}"
      elsif districts.size > 1
        puts "Multiple districts found: #{user.email}"
      else
        district = districts.first
      end

      school = nil
      schools =
        Organization
          .where(type:"School", name: vif_user_data.school).load

      if schools.size < 1
        puts "No school found: #{user.email}"
      elsif schools.size > 1
        puts "Multiple schools found: #{user.email}"
      else
        school = schools.first
      end

      if school && district
        if school.district_id != district.id
          puts "School/District mismatch: #{user.email}"
        else
          org_user =
            OrganizationUser.create(
              user: user,
              organization: school,
              role: "learner"
            )

          if !org_user.save
            puts "OrganizationUser could not be created: #{user.email}"
          end
        end
      end

      assigned =
        Assignment.assign(user.email, vif_user_data.collection_names, cet)

      if !assigned
        puts "Assignments could not be created: #{user.email}"
        raise ActiveRecord::Rollback
      end

      puts "Imported #{user.email}"
      true
    end
  end

  def self.for_articles
    where([
      "flags @> ? OR users.id IN (select user_id from articles)",
      %({"active": true})
    ])
  end

  def self.flagged(flag)
    where([
      "flags @> ?",
      %({"#{flag}": true})
    ])
  end

  def self.active
    flagged(:active)
  end

  def self.inactive
    where.not([
      "flags @> ?",
      %({"active": true})
    ])
  end

  def self.autocomplete_search(name)
    search(
      sort: [ { name_sort: "asc" } ],
      size: 6,
      query: {
        match: {
          name_autocomplete: {
            query: name,
            minimum_should_match: "100%"
          }
        }
      }
    ).to_a.map! { |result|
      result
        .fetch("_source")
        .slice(*%w(id name profile_photo_url expert))
    }
  end

  def superuser=(*args)
    # don't do anything
  end

  def really_assign_superuser=(value)
    write_attribute(:superuser, value)
  end

  def display_name
    name || email
  end

  def can?(action, object)
    Ability.new(self).can?(action, object)
  end

  def active?
    flags.fetch("active", false)
  end

  def cet?
    flags.fetch("cet", false)
  end

  def has_role?(role)
    roles.include?(role)
  end

  def expert?
    has_role?("expert")
  end

  def add_role!(role)
    raise "Role #{role} is invalid!" unless ROLES.include?(role)

    roles.push(role).uniq!
    save!
  end

  def remove_role!(role)
    self.roles.delete(role)
    save!
  end

  alias :expert :expert?

  def earned_badge?(badge)
    badge_assertions.where(badge_id: badge.id).exists?
  end

  def make_vifadmin
    organization_users.find_or_create_by(
      organization_id: Appo::Constants::VIF_ORG_ID, role: "admin")
  end

  def vifadmin?
    organization_users.exists?(
      organization_id: Appo::Constants::VIF_ORG_ID, role: "admin")
  end

  def as_json(params = {})
    super({ only: [:id, :name, :bio, :profile_photo_url, :google_profile_id,
      :external_profile_url_1, :external_profile_url_2, :twitter_username] }.merge(params))
  end

  def sign_in_via
    case
    when google_id then "google"
    when twitter_id then "twitter"
    when facebook_id then "facebook"
    when email && encrypted_password then "email"
    else raise "Unhandled option for user id: #{id}"
    end
  end


  # Auth

  def self.for_auth_token(auth_token)
    where("auth_tokens @> ?", [auth_token].to_json).first
  end

  def update_provider_id(provider, provider_id)
    update_attributes "#{provider}_id" => provider_id, :auth_tokens => push_token(Session.token)
  end

  def update_auth_token!
    if persisted?
      push_token(Session.token, true)
    elsif auth_tokens.empty?
      push_token(Session.token)
    end
  end

  def assign_preview_collections
    Collection.preview.each do |preview|
      assignments.create(assignable: preview)
    end
  end

  def token_history
    Secrets.brand.internal_emails.include?(self.email) ? 5 : 2
  end

  def push_token(auth_token, persist = false)
    self.auth_tokens = self.auth_tokens.unshift(auth_token).first(token_history)
    update_attribute(:auth_tokens, self.auth_tokens) if persist

    self.auth_tokens
  end

  def auth_token
    auth_tokens.first
  end

  def email_required?
    true unless facebook_id || google_id || twitter_id
  end

  def password_required?
    if (facebook_id || google_id || twitter_id) && !password.present?
      false
    else
      super
    end
  end

  def editable_collections(public_only = true)
    coll = Collection.where(%[
      user_id = ?
      OR id IN (
        SELECT collaboratable_id FROM collaborations
        WHERE collaboratable_type = ?
        AND collaborator_id = ?
        AND status = 'active'
      )],
      self.id, "Collection", self.id
    )
    coll = coll.where(visibility: "public") if public_only
    coll
  end

  def name
    value = super
    if value.present?
      value
    elsif email.present?
      email.to_s.split("@").first
    else
      nil
    end
  end

  def first_name
    (name || "").split(" ").first
  end

  def can_email?(key)
    email.present? && (disabled_communication & ["all", key.to_s]).empty?
  end

  def notify(key, params)
    Notification.create!(user_id: id, key: key.to_s, params: params)
  end

  def profile_photo_url
    avatar.file.present? ? avatar.url : read_attribute(:profile_photo_url)
  end

  def subscribed_to?(object)
    @_subscribed_to ||=
      subscriptions.pluck(:subscribable_type, :subscribable_id)

    @_subscribed_to.include? [object.class.name, object.id]
  end

  def can_administer?(user)
    user.id == self.id ||
      user.organizations.any?{ |org| org.is_admin?(self) }
  end

  def assign(assignable)
    assignments.find_or_create_by!(assignable: assignable)
  end

  private

  def normalize_data
    %w(
      name
      email
      bio
      lede
      twitter_username
      google_profile_id
      external_profile_url_1
      external_profile_url_2
    ).each do |field|
      current_value = send(field)
      next if current_value.nil?

      new_value = current_value.strip
      new_value = nil if new_value.empty?
      send("#{field}=", new_value) if new_value != current_value
    end
  end

  def maintain_expertise_tags
    return unless expertise_tags_changed?

    self.expertise_tags = expertise_tags.map do |tag|
      tag.downcase.strip.squish
    end.uniq.sort
  end

  def update_notifications
    if email_notifications == true
      disabled_communication.delete "all"
    elsif email_notifications == false
      disabled_communication << "all" unless disabled_communication.include? "all"
    end
  end

  def request_reconfirmation_if_email_changed
    if email_changed? && !email_was.blank?
      self.confirmed_at = nil
      send_confirmation_instructions if email.present?
    end
  end

  def reindex_embedded_user_data
    if (%w(name profile_photo_url roles) & previous_changes.keys).any?
      ReindexEmbeddedUserDataJob.perform_async(id)
    end
  end
end
