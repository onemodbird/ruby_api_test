class DeviseMailerPreview < ActionMailer::Preview
  def reset_password_instructions
    Devise::Mailer.confirmation_instructions(User.last, "insertRandomTokenHere")
  end
end
