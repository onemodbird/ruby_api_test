class ApplicationMailer < ActionMailer::Base
  default from: Secrets.from_address
  layout "mailer"

  helper MailerHelper
end

