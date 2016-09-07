require "rails_helper"

RSpec.describe Admin::FeaturedCollectionGroupsController, type: :controller do

  let(:user) { double superuser?: false, id: SecureRandom.uuid }
  let(:superuser) { double superuser?: true, id: SecureRandom.uuid }

  describe "not signed in" do
    it "redirects to login" do
      get :index

      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  describe "regular user" do
    it "redirects to admin home" do
      expect(controller).to receive(:authenticate_user!)
      allow(controller).to receive(:current_user).and_return(user)

      get :index

      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/admin")
      expect(flash[:alert]).to match(/not allowed/)
    end
  end

  describe "superuser" do

    before(:each) do
      expect(controller).to receive(:authenticate_user!)
      allow(controller).to receive(:current_user).and_return(superuser)
    end

    let(:fcg) { create :featured_collection_group }

    describe "GET #index" do
      it "lists featured collection groups" do
        create :featured_collection_group, visible: true

        get :index
        expect(assigns(:featured_collection_groups).size).to eq(1)
      end
    end

    describe "POST #create" do
      it "creates a featured collection group" do
        expect { post :create, collection_group_id: SecureRandom.uuid }
        .to change{ FeaturedCollectionGroup.count }.from(0).to(1)
      end
    end

    describe "DELETE #destroy" do
      it "deletes a featured collection group" do
        fcg
        expect { delete :destroy, id: fcg.id }
        .to change{ FeaturedCollectionGroup.count }.from(1).to(0)
      end
    end

    describe "PATCH #update" do
      it "updates a featured_collection_group" do
        expect(fcg.visible).to eq(false)

        patch :update, id: fcg.id, visible: true

        expect(fcg.reload.visible).to eq(true)
      end
    end

    describe "POST #reorder" do
      it "changes featured collection group ordering" do
        fcgs = (1..3).map{ |i|
          create :featured_collection_group, position: i, visible: true
        }

        expect(FeaturedCollectionGroup.for_display.pluck(:id))
        .to eq(fcgs.map(&:id))

        reordered_ids = fcgs.map(&:id).shuffle
        post :reorder, ids: reordered_ids.join(",")

        expect(FeaturedCollectionGroup.for_display.pluck(:id))
        .to eq(reordered_ids)
      end
    end
  end

end
