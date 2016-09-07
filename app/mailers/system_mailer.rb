class SystemMailer < ApplicationMailer
  layout :false

  def administrator_notification(subject, message = nil)
    subject = "[#{Rails.env.capitalize}] #{subject}"
    mail(to: Secrets.admin_address, subject: subject, body: message || subject)
  end

  def feedback(code, content, email, user_id = nil)
    @content = content
    @user = user_id.present? ? User.find_by(id: user_id) : nil

    mail(
    	to: Secrets.brand.feedback_address,
      reply_to: email,
    	subject: "Feedback received: #{code}"
    	)
  end
end
