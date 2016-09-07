class Collaboration < ActiveRecord::Base

  belongs_to :user
  belongs_to :collaborator, class_name: "User"
  belongs_to :collaboratable, polymorphic: true

  validates :email, format: { with: User::EMAIL_REGEX }, allow_nil: true
  validates :email, presence: true, unless: :collaborator_id
  validates :collaborator_id, presence: true, unless: :email

  before_create -> { self.token = self.class.token }
  before_destroy :destroy_notifications

  [:pending, :active].each do |status|
    define_method("#{status}?") { self.status == status.to_s }
  end

  def self.invite!(collaboratable, message: nil, emails: [], collaborator_ids: [])
    emails = Array(emails)
    collaborator_ids = Array(collaborator_ids)
    collaborations = []

    collaborations += emails.map do |email|
      invite_single!(collaboratable, message: message, email: email)
    end

    collaborations += collaborator_ids.map do |collaborator_id|
      invite_single!(collaboratable, message: message, collaborator_id: collaborator_id)
    end

    collaborations
  end

  def self.invite_single!(collaboratable, message: nil, email: nil, collaborator_id: nil)
    if email && collaborator_id
      raise "Invite using :email OR :collaborator params, but not both"
    end

    params = {
      user: collaboratable.user,
      collaborator: User.find_by(id: collaborator_id),
      email: email,
      message: message,
      status: "pending"
    }

    collaboratable.collaborations
      .create_with(params)
      .find_or_create_by!(params.slice(:email, :collaborator))
      .tap { |c| Event.emit! :collaboration_requested, c }
  end

  def self.token
    SecureRandom.urlsafe_base64
  end

  def confirm(collaborator, token)
    if token == self.token && pending?
      update_attributes collaborator_id: collaborator.id, status: "active"
      collaboratable.subscribe(collaborator.id) if collaboratable.respond_to?(:subscribe)

      Event.emit! :collaboration_invite_accepted, self
      true
    else
      false
    end
  end

  def link
    collaboratable.link
  end

  def link_with_token
    "#{link}?collaboration_token=#{token}"
  end

  def collaboratable_name
    collaboratable.class.name.downcase
  end

  private

  def destroy_notifications
    Notification.destroy(collaboration_id: id)
  end
end
