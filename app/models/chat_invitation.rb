# TODO handle :chat_invitation_accepted notification on front-end
class ChatInvitation < ActiveRecord::Base
  REINVITE_THRESHOLD = 5.minutes

  validates :email, format: { with: User::EMAIL_REGEX }
  validates :user_id, :chat_id, :email, presence: true

  belongs_to :user
  belongs_to :chat

  before_create { self.token = SecureRandom.urlsafe_base64 }
  before_validation(on: :create) { verify_no_recent_invitation }
  after_create :send_email, :track

  # emails - array or comma delimited list of email addresses
  def self.create_multiple(emails, params = {})
    results = { valid: [], invalid: [] }

    invitations = (emails || "").split(",").flatten.each do |email|
      invite = create(params.merge(email: email))
      results[invite.valid? ? :valid : :invalid] << email
    end

    results
  end

  def accept(accepting_user)
    update_attributes(accepted_at: Time.now, acceptor_id: accepting_user.id)
    user.notify(:chat_invitation_accepted, chat_id: chat_id, acceptor_id: accepting_user.id) if user.present?
    Tracking.track :chat_invitation_accepted, user: accepting_user, data: { chat_id: chat_id }
  end

  def url
    "#{chat.url}?chat_invitation_token=#{token}"
  end

  def send_email
    ChatInvitationMailer.invite(id).deliver_later
  end

  def track
    Tracking.track :chat_invitation_create, user: user, data: { chat_id: chat_id }
  end

  def verify_no_recent_invitation
    errors.add(:base, "An invitation was recently sent to this user.") if has_recent_invitation?
  end

  def has_recent_invitation?
    ChatInvitation
      .where(email: email, chat_id: chat_id)
      .where("created_at > ?", Time.now - REINVITE_THRESHOLD).exists?
  end
end
