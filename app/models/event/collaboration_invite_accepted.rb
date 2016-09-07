module Event
  class CollaborationInviteAccepted < Base
    def initialize(collaboration)
      @collaboration = collaboration
    end

    def process!
      notify_inviting_user_of_collaboration_acceptance
    end

    private

    def notify_inviting_user_of_collaboration_acceptance
      @collaboration.user.notify(
        key, collaboration_id: @collaboration.id)
    end
  end
end
