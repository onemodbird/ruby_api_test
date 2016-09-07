require "rails_helper"

describe UserSessionSerializer do
  let(:user) { create :user, :registered }
  let(:serialized) do
    UserSessionSerializer.serialize(user)
  end

  it "serializes recently visited chats" do
    old, newer = create_list(:chat, 2).tap{|subs| subs.each{ |sub| sub.subscribe(user.id) }}

    later = Timecop.freeze(1.hour)
    newer.subscribe(user.id)

    expect(serialized[:recent_chats].first[:updated_at_i]).to eq later.to_i
    expect(serialized[:recent_chats].first[:chat][:id]).to eq newer.id
    expect(serialized[:recent_chats].last[:chat][:id]).to eq old.id
  end

  it "should report that a user is a vifadmin" do
    user.make_vifadmin
    expect(serialized[:vifadmin]).to eq true
  end

  it "should report that a user is not a vifadmin" do
    expect(serialized[:vifadmin]).to eq false
  end

  it "should return demo data if a vif demo user" do
    user.flags["vif_demo_user"] = true
    expect(serialized[:organization_users].first["organization"]["id"]).to(
      eq "34f74a22-babc-49f3-ac14-2473c5be18d2")
  end
end
