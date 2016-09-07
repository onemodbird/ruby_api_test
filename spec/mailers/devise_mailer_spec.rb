require "rails_helper"

describe :devise_mailer do

  let(:user) { create :user, :registered }

  it 'uses the mailer layout for confirmation emails' do
    user.send_confirmation_instructions
<<<<<<< HEAD
    expect(mail_body).to match(/VIF-greenprint_02-01.png/)
=======
    expect(mail_body).to match(/VIF-Participate_02-01.png/)
>>>>>>> parent of 0bd3464... customize to greenprintmedia
  end

end
