require "rails_helper"

describe Collaboration do
  describe "with collections" do
    let(:user1) { create :user, :registered }
    let(:user2) { create :user, :registered }
    let(:collection) { create :collection, name: "new collection", user_id: user1.id }
    let(:collaboration) { create :collaboration }

    it "doesn't invite an invalid email" do
      expect {
        Collaboration.invite!(collection, emails: "abcd")
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "doesn't invite an invalid user" do
      expect {
        Collaboration.invite!(collection, collaborator_ids: SecureRandom.uuid)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "doesn't find collaborations for other collaboratables" do
      expect(collection).not_to eq(collaboration.collaboratable)

      new_collaboration =
        Collaboration.invite!(collection, emails: collaboration.email)[0]

      expect(new_collaboration.id).not_to eq(collaboration.id)
    end

    describe "with an invite" do
      let(:email) { "abcd@abcd.com" }
      let!(:collaboration) { Collaboration.invite!(collection, emails: email)[0] }

      it "creates a pending collaboration" do
        expect(collaboration.email).to eq "abcd@abcd.com"
        expect(collaboration.token).to_not be_blank
      end

      it "does not count a pending collaborator as active" do
        expect(collection.collaborators).to eq []
      end

      it "returns an array of collaborations" do
        collaborations =
          Collaboration.invite!(collection, emails: email, collaborator_ids: user2.id)

        expect(collaborations.size).to eq(2)
        expect(collaborations[0].email).to eq(email)
        expect(collaborations[1].collaborator_id).to eq(user2.id)
      end

      it "sends an email to the pending collaborator" do
        expect(mail_body).to match(collaboration.token)
        expect(mail_body).to match(/collections\/new\-collection\/#{collection.id}/)
      end

      it "resends an email to the pending collaborator" do
        mailbox.clear
        Collaboration.invite!(collection, emails: email)

        expect(mail_body).to match(collaboration.reload.token)
        expect(mail_body).to match(/collections\/new\-collection\/#{collection.id}/)
      end

      it "converts a pending collaborator to an active collabarator" do
        expect(collaboration.confirm(user2, collaboration.token)).to be_truthy
        expect(collection.collaborators.reload).to eq [user2]
        expect(collection.collaborator?(user2)).to be_truthy
      end

      it "subscribes to the collaboratable" do
        collaboration.confirm(user2, collaboration.token)
        expect(user2.subscriptions.first.subscribable).to eq collection
      end

      it "doesn't convert a pending collaborator if token is invalid" do
        expect(collaboration.confirm(user2, "nope")).to_not be_truthy
      end

    end

    describe "with an active collaborator" do
      let!(:collaboration) { collab!(collection, user2)[0] }

      it "should allow a collaborator to modify collection details" do
        expect(user1.can?(:update, collection)).to be_truthy
        expect(user2.can?(:update, collection)).to be_truthy
      end

      it "should not allow a collaborator to delete a collection" do
        expect(user1.can?(:destroy, collection)).to be_truthy
        expect(user2.can?(:destroy, collection)).to_not be_truthy
      end

      it "should not allow a collaborator to modify visibility" do
        expect(user1.can?(:visibility, collection)).to be_truthy
        expect(user2.can?(:visibility, collection)).to_not be_truthy
      end

      it "should not allow removed collaborators to modify collection details" do
        Collaboration.destroy_all
        expect(user2.can?(:update, collection)).to_not be_truthy
      end

      it "should send an email to the invitee" do
        Collaboration.invite!(collection, emails: "another@abcd.com")

        expect(mailbox.last.to).to eq ["another@abcd.com"]
        expect(mailbox.last.subject).to match /has invited you to collaborate/
      end

      it "sends a notification email on acceptance" do
        collaboration = Collaboration.invite!(collection, emails: "another@abcd.com")[0]
        collaboration.confirm(user2, collaboration.token)

        expect(mailbox.last.subject).to match /collaborating on #{collaboration.collaboratable.name}/
        expect(mail_body).to match /has accepted your invitation/
      end
    end

    it "uses the users name if available on acceptance email" do
      collaboration = Collaboration.invite!(collection, collaborator_ids: [user2.id])[0]
      collaboration.confirm(user2, collaboration.token)

      expect(mailbox.last.subject).to match /#{user2.name} is now collaborating/
    end
  end
end
