module Appo
  module Api
    class Feedback < Grape::API
      params do
        requires :content, type: String, allow_blank: false, desc: "Feedback content."
        requires :code, type: String, allow_blank: false, desc: "Feedback type code."
        requires :email, type: String, allow_blank: false, desc: "Email to reply to"
      end

      resource :feedback do
<<<<<<< HEAD
        desc "Send feedback to greenprint Learning"
=======
        desc "Send feedback to Participate Learning"
>>>>>>> parent of 0bd3464... customize to greenprintmedia
        route_setting :track, event: :feedback, data: [:code]
        post do
          user_id = current_user ? current_user.id : nil
          SystemMailer.feedback(p.code, p.content, p.email, user_id).deliver_later
        end
        { success: true }
      end
    end
  end
end