require "rails_helper"

describe Appo::Api::Vif do
  it "redirects to a mapped url" do
    resource = create :resource, viflearn_k2_item_id: 1234

    get "/v1/vif/redirect", id: 1234

    expect(response).to redirect_to(resource.link)
    expect_response_code_of 301
  end

  it "redirects to a 404 page" do
    get "/v1/vif/redirect", id: 5432

    expect(response).to redirect_to("#{Secrets.site_url}/search")
    expect_response_code_of 302
  end
end
