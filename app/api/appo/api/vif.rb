module Appo
  module Api
    class Vif < Grape::API

<<<<<<< HEAD
      desc "Redirect legacy greenprintmedia.org urls"
=======
      desc "Redirect legacy greenprintmedia.org urls"
>>>>>>> parent of 0bd3464... customize to greenprintmedia
      params do
        requires :id, type: Integer
      end
      route_setting :track, event: :vif_redirect, data: [:id]
      get "vif/redirect" do
<<<<<<< HEAD
        resource = Resource.find_by(greenprintmedia_k2_item_id: p.id)
=======
        resource = Resource.find_by(viflearn_k2_item_id: p.id)
>>>>>>> parent of 0bd3464... customize to greenprintmedia
        if resource
          redirect resource.link, permanent: true
        else
          redirect "#{Secrets.site_url}/search"
        end
      end

    end
  end
end
