require "rails_helper"

describe Comment do
  let(:other) { create :user, :registered }
  let(:creator) { create :user, :registered }
  let(:collection) { create :collection, user: creator }
  let(:resource) { create :resource, user: creator }
  let(:comment) { create :comment, user: creator, commentable: collection }

  it "allows comments on a commentable" do
    expect{ collection.comment(creator, "A comment!") }.to change{ Comment.count }.by(1)
    expect(Comment.first.user).to eq creator
    expect(Comment.first.content).to eq "A comment!"
  end

  it "defaults to no edit time" do
    expect(comment.edited_at).to eq nil
  end

  it "captures edit time" do
    expect(comment.edited_at).to eq nil

    time = Timecop.freeze 10.minutes
    comment.update(content: "Changed")
    expect(comment.edited_at.to_i).to eq time.to_i
  end

  it "publishes a comment_created event" do
    expect(RealtimeService).to receive(:publish).with(collection, :comment_created, true, anything)
    comment # touch
  end

  it "sends notifications email on creation" do
    create_list(:user, 2, :registered).each do |u|
      collab!(collection, u)

      expect(mailbox.last.to).to eq [collection.user.email]
      expect(mailbox.last.subject).to match /collaborating on #{collection.name}/
      expect(mail_body).to match /invitation to collaborate on #{collection.name}/
    end
  end

  it "publishes a comment_update event" do
    comment # touch
    expect(RealtimeService).to receive(:publish).with(collection, :comment_updated, true, anything)
    comment.update(content: "Changed")
  end

  it "publishes a comment_deleted event" do
    comment # touch
    expect(RealtimeService).to receive(:publish).with(collection, :comment_deleted, true, anything)
    comment.destroy
  end

  it "notifies owner and other collaborators" do
    users = create_list(:user, 2, :registered)
    collab!(collection, users)

    create :comment, user: users[0], commentable: collection

    expect_notification(/commented on/, [creator, users[1]])
  end

  it "only notifies the creator of a resource" do
    create :comment, user: other, commentable: resource

    expect_notification(/commented on/, [creator])
  end

  it "does not notify non-collaborating subscribers" do
    subscriber = create :user
    collection.subscribe(subscriber.id)

    mailbox.clear
    create :comment, user: creator, commentable: collection

    expect(mailbox).to be_empty
  end
end
