module Event
  class CollaborationRequested < Base
    def initialize(collaboration)
      @collaboration = collaboration
    end

    def process!
      send_invitation_email
    end

    private

    def send_invitation_email
      return unless @collaboration.pending?

      if collaborator.nil? || collaborator.can_email?(key)
        CollaborationMailer.invite(@collaboration.id).deliver_later
      end
    end

    def collaborator
      @collaboration.collaborator
    end
  end
end
