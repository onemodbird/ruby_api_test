module Appo
  module Importers
    class Categories

      SOURCE_URLS = {
        vet: 'https://dataclips.heroku.com/jgioodnbnujtsygkwlsnwubbrvmc.json',
        net: 'https://dataclips.heroku.com/lzauvmeeopbmaffdxtvhedhchial.json',
        edu: 'https://dataclips.heroku.com/zqbjgfucweplccqndcuqrkmcasbi.json'
      }

      def self.import!
        new.import!
      end

      def import!
        import_categories
        import_app_reviews
      end

      def categories
        @categories ||= [].tap do |records|
          SOURCE_URLS.values.each do |source_url|
            records.concat Fetchers::Dataclip.new(source_url).records
          end
        end
      end

      def import_categories
        %w(vet net edu).each do |src|
          tg = TagGroup.find_or_initialize_by(name: "#{src.upcase} Categories")
          categories.select{|c| c.fetch('data_source') == src}.each do |c|
            tg.tags
                .push(c.fetch('name'))
                .push(c.fetch('category_group').fetch('name'))
                .push(c.fetch('top_level_category_group').fetch('name'))
                .uniq!
            c2 = c.reject{|k,v| %w(app_reviews).include?(k)}
            unless tg.imported_data.has_key?('categories')
              tg.imported_data['categories'] = []
            end
            tg.imported_data.fetch('categories').push(c2).uniq!
          end
          tg.save!
        end
      end

      def user_id_for_review reviewer
        id = reviewer.fetch('id')
        data_source = reviewer.fetch('data_source')
        users = User.where([
          "imported_data->'reviewers' @> ?",
          %( [{"id": #{id}, "data_source": "#{data_source}"}] )
        ])
        if users.size > 1
          raise "TOO MANY USERS: #{users.inspect}"
        end
        users.first.id
      end

      def make_review app_review
        return nil if app_review
                      .fetch('rubric_scores')
                      .map{|rs| rs.fetch('score')}
                      .any?(&:nil?)

        content_score, engagement_score, feature_score =
          review_scores(
            app_review.fetch('rubric_id'),
            app_review.fetch('rubric_scores')
          )

        review = Review.new({
          'content_score' => content_score,
          'engagement_score' => engagement_score,
          'feature_score' => feature_score,
          'user_id' => user_id_for_review(app_review.fetch('reviewer')),
          'lede' => app_review.fetch('lede'),
          'comment' => [
            app_review.fetch('review_answer_1'),
            app_review.fetch('review_answer_2'),
            app_review.fetch('review_answer_3')
          ].compact.map(&:strip).join("\n\n"),
          'published_at' => app_review.fetch('published_at'),
          'created_at' => app_review.fetch('created_at'),
          'updated_at' => app_review.fetch('updated_at')
        })

        review
      end

      def review_scores rubric_id, rubric_scores
        score_map = case rubric_id
        when 1
          [[1,2,3], [4,5,6], [7,8,9,10]]
        when 2
          [[1,2,3], [4,5,6], [7,8,9,10,11]]
        when 3
          [[1,2,3], [4,5,6], [7,8,9,10]]
        when 4
          [[1,2,3,13,14], [4,5,6,7,8], [9,10,11,12]]
        else
          raise "Invalid rubric_id: #{rubric_id}"
        end

        score_map.map { |sm|
          scores = rubric_scores.select { |rs|
            sm.include? rs.fetch('rubric_criterion_id')
          }.map { |rs|
            rs.fetch('score')
          }
          ( scores.sum.to_f / (sm.size * 3) * 10 ).round
        }
      end

      def import_app_reviews
        categories.each do |c|

          tmp_tags = [
            c.fetch('name'),
            c.fetch('category_group').fetch('name'),
            c.fetch('top_level_category_group').fetch('name')
          ]

          grade_levels = []
          subject_tags = []
          topic_tags = []
          tags = []

          grade_level_lookup = {
            "Kindergarten" => "K",
            "First Grade" => "1st",
            "Second Grade" => "2nd",
            "Third Grade" => "3rd",
            "Fourth Grade" => "4th",
            "Fifth Grade" => "5th",
            "Sixth Grade" => "6th",
            "Seventh Grade" => "7th",
            "Eighth Grade" => "8th",
            "Ninth Grade" => "9th",
            "Tenth Grade" => "10th",
            "Eleventh Grade" => "11th",
            "Twelfth Grade" => "12th"
          }

          tmp_tags.each do |tag|
            if Appo::ResourceTags::GRADES.include?(tag)
              grade_levels << tag
            elsif grade_level_lookup.keys.include?(tag)
              grade_levels << grade_level_lookup.fetch(tag)
            elsif Appo::ResourceTags::SUBJECTS.include?(tag)
              subject_tags << tag
            elsif Appo::ResourceTags::TOPICS.include?(tag)
              topic_tags << tag
            else
              tags << tag
            end
          end

          c.fetch('app_reviews').each do |ar|

            review = make_review(ar)

            if ar.has_key?('device_family_id') &&
               ar.fetch('device_family_id') == 5
              # video
              url = PostRank::URI.clean(
                ar.fetch('video_id') =~ /\A\d+\z/ ?
                "http://vimeo.com/#{ar.fetch('video_id')}" :
                "https://www.youtube.com/watch?v=#{ar.fetch('video_id')}"
              )
              data = {
                'kind' => 'video',
                'price' => 'Free',
                'url' => url,
                'name' => ar.fetch('video_title'),
                'image_url' => ar.fetch('screenshots').first.fetch('url'),
                'subject_tags' => subject_tags,
                'topic_tags' => topic_tags,
                'tags' => tags,
                'grade_levels' => grade_levels,
                'common_core_tags' => ar.fetch('common_core_tags')
                                        .to_s
                                        .split(' ')
                                        .map(&:strip),
                'screenshot_urls' => [],
                'imported_data' => {
                  'app_reviews' => [ ar ]
                },
                'published_at' => ar.fetch('published_at'),
                'created_at' => ar.fetch('created_at'),
                'updated_at' => ar.fetch('updated_at')
              }
            else
              # app
              app = ar.fetch('app')

              if app.has_key?('os')
                if app.fetch('os') == 'ios'
                  url = "https://itunes.apple.com/app/id#{app.fetch('app_store_id')}"
                else
                  url = "https://play.google.com/store/apps/details?id=#{app.fetch('app_store_id')}"
                end
              else
                url = "https://itunes.apple.com/app/id#{app.fetch('app_store_id')}"
              end
              url = PostRank::URI.clean(url)

              data = {
                'kind' => 'app',
                'url' => url,
                'price' => app.fetch('price'),
                'name' => app.fetch('name'),
                'image_url' => app.fetch('icon_url'),
                'subject_tags' => subject_tags,
                'topic_tags' => topic_tags,
                'tags' => tags,
                'grade_levels' => grade_levels,
                'common_core_tags' => ar.fetch('common_core_tags', nil)
                                        .to_s
                                        .split(' ')
                                        .map(&:strip),
                'screenshot_urls' => ar.fetch('screenshots').map{|ss| ss.fetch('url')},
                'imported_data' => {
                  'app_reviews' => [ ar ]
                },
                'published_at' => ar.fetch('published_at'),
                'created_at' => app.fetch('created_at'),
                'updated_at' => app.fetch('updated_at')
              }
            end

            resource = Resource.find_by_url(url)
            if resource
              resource.common_core_tags.concat(data.fetch('common_core_tags')).uniq!
              resource.subject_tags.concat(data.fetch('subject_tags')).uniq!
              resource.topic_tags.concat(data.fetch('topic_tags')).uniq!
              resource.tags.concat(data.fetch('tags')).uniq!
              resource.grade_levels.concat(data.fetch('grade_levels')).uniq!
              resource.screenshot_urls.concat(data.fetch('screenshot_urls')).uniq!
              resource.imported_data['app_reviews'] = Array(
                resource.imported_data['app_reviews']
              ).concat(
                data.fetch('imported_data').fetch('app_reviews')
              )
            else
              resource = Resource.new(data)
            end

            resource.transaction do
              resource.save!
              if review
                review.resource_id = resource.id
                review.save!
                resource.reviews.push(review.attributes)
                if resource.lede.blank? && review.lede.present?
                  resource.lede = review.lede
                end
                resource.save!
              end
            end

          end
        end
      end


    end
  end
end
