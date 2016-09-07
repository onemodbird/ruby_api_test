require "rails_helper"

describe CollaborationMailer do

  let(:user1) { create :user, :facebook }
  let(:user2) { create :user, :facebook }
  let(:collection) { create :collection, name: "new collection", user_id: user1.id }

  it 'uses the mailer layout for collaboration emails' do
    Collaboration.invite!(collection, emails: "abcd@abcd.com")
<<<<<<< HEAD
    expect(mail_body).to match(/VIF-greenprint_02-01.png/)
=======
    expect(mail_body).to match(/VIF-Participate_02-01.png/)
>>>>>>> parent of 0bd3464... customize to greenprintmedia
  end

end
