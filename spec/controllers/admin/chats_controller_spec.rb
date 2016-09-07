require "rails_helper"
require "shared/schedule_examples"

describe Admin::ChatsController, :type => :controller do

  let(:superuser) { instance_double("User", superuser?: true) }

  before(:each) do
    expect(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(superuser)
  end

  describe ".create" do
    it "defaults archived_at to nil" do
      expect { post :create, chat: { name: "#myChat" } }
        .to change(Chat, :count).from(0).to(1)

      expect(Chat.first.archived_at).to eq(nil)
    end

    it "normalizes the name" do
      post :create, chat: { name: "myChat" }
      expect(Chat.first.name).to eq("#myChat")
    end
  end

  describe ".update" do
    let(:chat) { create :chat, :with_schedule }

    def update(chat_params={})
      defaults = chat.attributes.symbolize_keys.merge(default_schedule_params)
      put :update, id: chat.id, chat: defaults.merge(chat_params)
    end

    include_examples "schedule examples"
  end

  describe "archive" do
    let(:chat) { create :chat }

    it "archives a chat" do
      put :archive, id: chat.id

      expect(chat.reload.archived_at).to_not be_nil
    end
  end
end
