require 'rails_helper'

describe Appo::Api::Reviews do

  before(:each) do
    @user = User.create!(:facebook_id => '123', :email => nil)
    @user.update_auth_token!
    @resource = Resource.create!(:kind => 'video', :name => 'cat vid', :url => 'http://vid.com/cat')
  end

  def create_review!(params = {})
    post "/v1/reviews", { format: 'json', auth_token: @user.auth_token,
      review: { resource_id: @resource.id, comment: 'a cool vid', :content_score => 7, :feature_score => 6, :engagement_score => 5 }}.merge(params)
  end

  def update_review!(params = {})
    put "/v1/reviews/#{Review.last.id}", { format: 'json', auth_token: @user.auth_token,
      review: { comment: 'a REALLY cool vid' }}.merge(params)
  end

  it 'should let users create reviews' do
    create_review!

    expect(response.status).to eq 201
    review = Review.last
    expect(review).to_not be_nil
    expect(review.user_id).to eq @user.id
    expect(review.comment).to eq 'a cool vid'
  end

  it 'should not create reviews without a user' do
    create_review! auth_token: 'xyz'
    review = Review.last
    expect(review).to be_nil
  end

  it 'should let users update their reviews' do
    create_review!
    update_review!

    review = Review.last
    expect(review.user_id).to eq @user.id
    expect(review.comment).to eq 'a REALLY cool vid'
  end

  it 'should not let users update other reviews' do
    @user2 = User.create!(:facebook_id => '456', :email => nil)
    @user2.update_auth_token!

    create_review!
    update_review! auth_token: @user2.auth_token
    expect(response.body).to match /Unauthorized/
  end

  it 'should set expert to false when user is not an expert' do
    create_review!

    review = Review.last
    expect(review.expert).to eq(false)
  end

  it 'should set expert to true when user is an expert' do
    @user.update_attributes!(roles: '["expert"]')
    create_review!

    review = Review.last
    expect(review.expert).to eq(true)
  end
end
