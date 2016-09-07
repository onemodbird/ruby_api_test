require "rails_helper"

describe Appo::Api::Passwords do

  let(:user) { create :user, :registered }
  let(:token) { mail_body.match(/reset_password_token\=([^"]+)/)[1] }

  it "sends forgot password instructions" do
    api_post "/v1/passwords", nil, { email: user.email }

    expect_response_code_of 201
    resp = JSON.parse(response.body)
    expect(resp["success"]).to eq true

    expect(mailbox.count).to eq 2
    expect(mailbox.last.subject).to match /password/
    expect(user.valid_password?("password")).to be_truthy # Not updated yet
  end

  it "updates a forgotten password" do
    api_post "/v1/passwords", nil, { email: user.email }
    api_put "/v1/passwords/#{token}", nil, { password: "floopdedoop", password_confirmation: "floopdedoop"  }

    expect_response_code_of 200
    user.reload
    expect(user.valid_password?("floopdedoop")).to be_truthy
  end

  it "does not update a forgotten password without a password confirmation" do
    api_post "/v1/passwords", nil, { email: user.email }
    api_put "/v1/passwords/#{token}", nil, { password: "floopdedoop" }

    expect_response_code_of 400
    user.reload
    expect(user.valid_password?("floopdedoop")).to_not be_truthy
  end

  it "does not update a forgotten password with a mismatched password confirmation" do
    api_post "/v1/passwords", nil, { email: user.email }
    api_put "/v1/passwords/#{token}", nil, { password: "floopdedoop", password_confirmation: "floopdederp" }

    expect_response_code_of 400
    user.reload
    expect(user.valid_password?("floopdedoop")).to_not be_truthy
  end

  it "does not update a forgotten password with an invalid password" do
    api_post "/v1/passwords", nil, { email: user.email }
    api_put "/v1/passwords/#{token}", nil, { password: "zzzz", password_confirmation: "zzzz" }

    expect_response_code_of 400
    user.reload
    expect(user.valid_password?("zzzz")).to_not be_truthy
  end

  it "does not update a forgotten password with invalid details" do
    api_post "/v1/passwords", nil, { email: user.email }
    api_put "/v1/passwords/abcdefg", nil, { password: "floopdedoop", password_confirmation: "floopdedoop" }
    expect_response_code_of 400
    user.reload
    expect(user.valid_password?("floopdedoop")).to_not be_truthy
  end

end