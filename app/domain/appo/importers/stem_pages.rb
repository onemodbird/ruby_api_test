module Appo
  module Importers
    class StemPages

      SOURCE_URL =
        'https://dataclips.heroku.com/qndrbjgdakkyspyfqthezkjwbdnx.json'

      def self.import!
        new.import!
      end

      def import!
        import_categories
        import_videos
        import_apps
        import_websites
      end

      def stem_pages
        @stem_pages ||= Fetchers::Dataclip.new(SOURCE_URL).records
      end

      def import_categories
        tg = TagGroup.find_or_initialize_by(name: 'STEM Pages')
        stem_pages.each do |sp|
          tg.tags.push(sp.fetch('name')).uniq!
          unless tg.imported_data.has_key?('stem_pages')
            tg.imported_data['stem_pages'] = []
          end
          stem_page = sp.reject{|k,v| %w(stem_websites stem_apps stem_videos).include?(k)}
          tg.imported_data['stem_pages'].push(stem_page).uniq!
        end
        tg.save!
      end

      def import_videos
        stem_pages.each do |sp|
          sp.fetch('stem_videos').each do |stem_video|
            video = stem_video.fetch('video')
            url = PostRank::URI.clean video.fetch('url')
            video = video.merge 'url' => url
            resource = Resource.find_by_url(url)
            if resource
              unless resource.imported_data.has_key?('stem_videos')
                resource.imported_data['stem_videos'] = []
              end
              unless resource.imported_data.fetch('stem_videos').include?(stem_video)
                resource.imported_data.fetch('stem_videos') << stem_video
                resource.tags.push(sp.fetch('name')).uniq!
              end
            else
              resource = Resource.new
              resource.attributes =
                video
                  .select { |k,v| Resource.new.attributes.keys.include?(k) }
                  .merge('imported_data' => { 'stem_videos' => [stem_video] })
                  .merge('tags' => [ sp.fetch('name') ])
                  .merge('kind' => 'video', 'url' => url)
                  .merge('price' => 'Free')
                  .merge('published_at' => sp.fetch('published_at'))
            end
            unless resource.save
              raise "Could not save: ERRORS=#{resource.errors.to_a.inspect}, RESOURCE=#{resource.inspect}"
            end
          end
        end
      end

      def import_apps
        stem_pages.each do |sp|
          sp.fetch('stem_apps').each do |stem_app|
            app = stem_app.fetch('app')
            url = PostRank::URI.clean(
              app.fetch('os') == 'ios' ?
              "https://itunes.apple.com/app/id#{app.fetch('app_store_id')}" :
              "https://play.google.com/store/apps/details?id=#{app.fetch('app_store_id')}"
            )
            app = app.merge('url' => url, 'image_url' => app.fetch('icon_url'))
            resource = Resource.find_by_url(url)
            if resource
              unless resource.imported_data.has_key?('stem_apps')
                resource.imported_data['stem_apps'] = []
              end
              unless resource.imported_data.fetch('stem_apps').include?(stem_app)
                resource.imported_data.fetch('stem_apps') << stem_app
                resource.tags.push(sp.fetch('name')).uniq!
              end
            else
              resource = Resource.new
              resource.attributes =
                app
                  .select { |k,v| Resource.new.attributes.keys.include?(k) }
                  .merge('imported_data' => { 'stem_apps' => [stem_app] })
                  .merge('tags' => [ sp.fetch('name') ])
                  .merge('kind' => 'app', 'url' => url)
                  .merge('price' => app.fetch('price'))
                  .merge('published_at' => sp.fetch('published_at'))
            end
            unless resource.save
              raise "Could not save: ERRORS=#{resource.errors.to_a.inspect}, RESOURCE=#{resource.inspect}"
            end
          end
        end
      end

      def import_websites
        stem_pages.each do |sp|
          sp.fetch('stem_websites').each do |stem_website|
            website = stem_website.fetch('website')
            url = PostRank::URI.clean website.fetch('url')
            website = website.merge 'url' => url
            resource = Resource.find_by_url(url)
            if resource
              unless resource.imported_data.has_key?('stem_websites')
                resource.imported_data['stem_websites'] = []
              end
              unless resource.imported_data.fetch('stem_websites').include?(stem_website)
                resource.imported_data.fetch('stem_websites') << stem_website
                resource.tags.push(sp.fetch('name')).uniq!
              end
            else
              resource = Resource.new
              resource.attributes =
                website
                  .select { |k,v| Resource.new.attributes.keys.include?(k) }
                  .merge('imported_data' => { 'stem_websites' => [stem_website] })
                  .merge('tags' => [ sp.fetch('name') ])
                  .merge('kind' => 'webpage', 'url' => url)
                  .merge('price' => 'Free')
                  .merge('published_at' => sp.fetch('published_at'))
            end
            unless resource.save
              raise "Could not save: " <<
                    "ERRORS=#{resource.errors.to_a.inspect}, " <<
                    "RESOURCE=#{resource.inspect}"
            end
          end
        end
      end

    end
  end
end
