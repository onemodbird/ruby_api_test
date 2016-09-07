require 'rails_helper'

RSpec.describe Admin::ResourcesController, :type => :controller do

  describe '#index' do
    it 'can find resources by kind' do
      resource = Resource.create!(kind: 'webpage', url: 'https://url')
      expect(controller).to receive(:authenticate_user!)

      get :index, resources: { kind: ['Webpage'], with: [] }

      expect(response.code).to eq('200')
      expect(assigns['resources']).to eq([resource])
    end
  end

  describe '#create' do

    it 'uses Appo::ResourceFactory' do
      kind = 'webpage'
      url = 'https://example.com/'
      resource = Resource.create!(kind: kind, url: url)
      expect(controller).to receive(:authenticate_user!)

      post :create, resource: { kind: kind, url: url }

      expect(response.code).to eq('302')
    end
  end

end
