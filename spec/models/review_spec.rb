require 'rails_helper'

describe Review do

  before(:each) do
    @user = User.create!(facebook_id: '123', email: nil)
  end

  it 'should allow creation of a valid review' do
    resource = Resource.create!(kind: 'video', url: 'http://youtube.com')
    Review.create!(user_id: @user.id, resource_id: resource.id, comment: 'cool stuff')
  end

  it 'should not allow creation of a review without a resource' do
    review = Review.create(user_id: @user.id, resource_id: @user.id, comment: 'cool stuff')
    expect(review).to be_invalid
  end

end
