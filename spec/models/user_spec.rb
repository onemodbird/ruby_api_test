require "rails_helper"

describe User do

  def has_before_save_callback(identifier)
    !!User
      ._save_callbacks
      .find { |cb|
        cb.kind == :before &&
        cb.filter == identifier
      }
  end

  let(:user) { create :user }
  let(:normalized_fields) {
    %w(
      name
      email
      bio
      lede
      twitter_username
      google_profile_id
      external_profile_url_1
      external_profile_url_2
    )
  }

  let(:user) { create :user }

  it "allows a role to be added" do
    user.add_role!("content_creator")
    expect(user.reload).to have_role("content_creator")
  end

  it "raises when a role added is not valid" do
    expect { user.add_role!("junk") }.to raise_error(RuntimeError)
  end

  it "removes a role" do
    user.add_role!("content_creator")
    user.add_role!("expert")
    user.remove_role!("content_creator")

    expect(user.reload.roles).to eq ["expert"]
  end

  it "allows single quotes in the local (left) part of email addresses" do
    user = User.new(email: "bob.o'mally@example.com")
    user.valid?

    expect(user.errors[:email].any?).to eq(false)
  end

  it "strips leading/trailing whitespace from user input on save" do
    attributes = normalized_fields.map{ |f| [f, "\t x \n"] }.to_h
    user = User.new attributes
    user.send(:normalize_data)

    expect(has_before_save_callback(:normalize_data)).to eq(true)
    normalized_fields.each do |f|
      expect(user.public_send(f)).to eq("x")
    end
  end

  it "converts blank strings from user input to nil on save" do
    attributes = normalized_fields.map{ |f| [f, "\t \r \n"] }.to_h
    user = User.new attributes
    user.send(:normalize_data)

    expect(has_before_save_callback(:normalize_data)).to eq(true)
    normalized_fields.each do |f|
      expect(user.public_send(f)).to eq(nil)
    end
  end

  it "returns name value when name is present" do
    user = User.new name: "name"
    expect(user.name).to eq("name")
  end

  it "returns email preceding @ as name when name is blank" do
    user = User.new name: nil, email: "email.name@domain.com"
    expect(user.name).to eq("email.name")
  end

  it "attempts to split out the first name" do
    user = create :user, :registered, name: "Jason Whatever"
    expect(user.first_name).to eq "Jason"
  end

  it "finds a user by auth token" do
    user = create :user, :registered
    token = user.auth_tokens.first

    expect(User.for_auth_token(token)).to eq user
  end

  it "sends a single confirmation email for a new user" do
    mailbox.clear
    user = create :user, :registered

    expect(mailbox.count).to eq 1
    expect(mailbox.first.subject).to match /Welcome/
  end

  it "disables email notifications" do
    user = create :user, :registered
    user.update(email_notifications: false)

    expect(user.disabled_communication).to eq ["all"]
    expect(user.can_email?(:collaboration_invite_accepted)).to eq false
  end

  it "enables email notifications" do
    user = create :user, :registered
    user.update(email_notifications: true)

    expect(user.disabled_communication).to eq []
    expect(user.can_email?(:collaboration_invite_accepted)).to eq true
  end

  it "won't attempt to email a non-emailed user" do
    user = create :user, :facebook, email: nil

    expect(user.can_email?(:collaboration_invite_accepted)).to eq false
  end

  it "allows valid grade levels" do
    user = create :user, :registered
    user.grade_levels = %w(K 1st 11th)

    expect(user).to be_valid
  end

  it "does not allow invalid grade levels" do
    user = create :user, :registered
    user.grade_levels = %w(1st nope)

    expect(user).to_not be_valid
  end

  it "uses avatar url when available" do
    user = create :user, :with_avatar, { profile_photo_url: "https://nope.not.it/a.jpg" }
    expect(user.profile_photo_url).to_not eq "https://nope.not.it/a.jpg"
  end

  describe "reindex where user is embedded" do
    let(:user) { create :user, :with_avatar }

    before :each do
      expect(ReindexEmbeddedUserDataJob).to receive(:perform_async).with(user.id)
    end

    [:name, :profile_photo_url].each do |field|
      it "reindexes when #{field} changes" do
        user.update(field => "#{user.name}x")
      end
    end

    it "reindexes when expert role changes" do
      user.update(roles: ["expert"])
    end
  end

  context "with a school/district" do
    let(:district) { create :district }
    let(:school) { create :school, district_id: district.id }
    let(:learner) { create :user }

    it "allows a district admin to administer a user" do
      district.add_user(user, :admin)
      school.add_user(learner, :learner)

      expect(user.can_administer?(learner)).to eq true
    end

    it "allows an admin to administer a user" do
      school.add_user(user, :admin)
      school.add_user(learner, :learner)

      expect(user.can_administer?(learner)).to eq true
    end

    it "allows me to administer myself" do
      expect(user.can_administer?(user))
    end
  end

  context "roles" do

    it "allows resource edits to content creators" do
      user = create(:user, roles: ["content_creator"])
      resource = create(:resource)

      expect(user.can?(:edit, resource))
    end

  end
end
