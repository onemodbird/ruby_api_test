FactoryGirl.define do
  factory :state, parent: :organization, class: "State" do
    type "State"
  end
end
