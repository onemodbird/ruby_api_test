require "rails_helper"

describe Appo::Api::Organizations do
  def create_school
    create :school, :with_users,
      user_count: 1, district_id: district.id, state_id: state.id
  end
  let(:state) { create :state }
  let(:district) { create :district, state_id: state.id }
  let(:school) { create_school }

  let(:learner) { school.learners.first }
  let(:school_admin) { school.add_user(create(:user), :admin) }
  let(:district_admin) { district.add_user(create(:user), :admin) }
  let(:state_admin) { state.add_user(create(:user), :admin) }

  it "requires user to be logged in to view organization" do
    get "/v1/organizations/#{district.id}"
    expect_response_code_of 403
  end

  it "does not allow me to view organization if learner" do
    api_get "/v1/organizations/#{district.id}", learner
    expect_response_code_of 403
  end

  it "allows access to the district if I am a district admin" do
    api_get "/v1/organizations/#{district.id}", district_admin
    expect(json_response["id"]).to eq district.id
  end

  it "does not allow district admin to view state" do
    api_get "/v1/organizations/#{state.id}", district_admin
    expect(json_response["id"]).to eq nil
  end

  context "with a hierarchy" do
    let!(:school) { create_school }
    let(:vifadmin) { create(:user).tap{ |user| user.make_vifadmin } }

    it "retrieves root organizations" do
      naked_district = create :district, salesforce_id: Appo::Constants::PASSPORT_WHOLE_SCHOOLS.first

      api_get "/v1/organizations/root", vifadmin
      expect(json_response).to match_ids_of [naked_district]
    end

    it "does not allow root organizations for non-superusers" do
      api_get "/v1/organizations/root", state_admin
      expect_response_code_of 403
    end

    it "allows state admin to view district" do
      api_get "/v1/organizations/#{district.id}", state_admin
      expect(json_response["id"]).to eq district.id
    end

    it "allows state admin to view school" do
      api_get "/v1/organizations/#{school.id}", state_admin
      expect(json_response["id"]).to eq school.id
    end

    it "allows district admin to view school" do
      api_get "/v1/organizations/#{school.id}", district_admin
      expect(json_response["id"]).to eq school.id
    end

    it "allows school admin to view school" do
      api_get "/v1/organizations/#{school.id}", school_admin
      expect(json_response["id"]).to eq school.id
    end

    it "receives correct number of learners for district" do
      api_get "/v1/organizations/#{district.id}/metrics", district_admin
      expect(json_response["learner_count"]).to eq 1
    end

    it "does not allow school admin to view district" do
      api_get "/v1/organizations/#{district.id}", school_admin
      expect_response_code_of 403
    end

    it "does not allow school admin to view state" do
      api_get "/v1/organizations/#{state.id}", school_admin
      expect_response_code_of 403
    end

    context "with a hierarchy" do
      let!(:school) { create_school }

      it "allows state admin to view district" do
        api_get "/v1/organizations/#{district.id}", state_admin
        expect(json_response["id"]).to eq district.id
      end

      it "allows state admin to view school" do
        api_get "/v1/organizations/#{school.id}", state_admin
        expect(json_response["id"]).to eq school.id
      end

      it "receives correct number of learners for district" do
        api_get "/v1/organizations/#{district.id}/metrics", district_admin
        expect(json_response["learner_count"]).to eq 1
      end

      it "receives correct number of learners for a school" do
        api_get "/v1/organizations/#{district.id}/metrics", district_admin
        expect(json_response["schools"].first["learner_count"]).to eq 1
      end

      it "allows district admin to view school" do
        api_get "/v1/organizations/#{school.id}", district_admin
        expect(json_response["id"]).to eq school.id
      end

      it "allows access to the school if I am a school admin" do
        api_get "/v1/organizations/#{school.id}", school_admin
        expect(json_response["id"]).to eq school.id
      end

      it "does not allow school admin to view district" do
        api_get "/v1/organizations/#{district.id}", school_admin
        expect_response_code_of 403
      end

      it "does not allow school admin to view state" do
        api_get "/v1/organizations/#{state.id}", school_admin
        expect_response_code_of 403
      end

      it "returns learners if requested" do
        api_get "/v1/organizations/#{state.id}/metrics", state_admin, include_learners: true

        expect(json_response["learners"]).to match_ids_of school.users
        expect(json_response["learners"].first.keys).to include("badge_assertions", "assignments_count")
      end

      it "does not return learners by default" do
        api_get "/v1/organizations/#{state.id}/metrics", state_admin
        expect(json_response).to_not include("learners")
      end
    end
  end

  context "with a vif_demo_user" do
    let(:demouser) { create :user, flags: {"vif_demo_user":true} }

    it "returns demo data for a demo user" do
      api_get "/v1/organizations/#{district.id}/metrics", demouser
      expect(json_response["id"]).to eq "34f74a22-babc-49f3-ac14-2473c5be18d2"
    end
  end
end
