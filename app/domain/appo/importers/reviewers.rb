module Appo
  module Importers
    class Reviewers

      SOURCE_URLS = {
        vet: 'https://dataclips.heroku.com/ypajfbiszcxnvgmiznkboogswfjz.json',
        net: 'https://dataclips.heroku.com/rtimourrpupyehqzarwjxsqpfkov.json',
        edu: 'https://dataclips.heroku.com/tkjzpqdpwhbwaicinxxyxyjkfrlc.json'
      }

      def self.import!
        new.import!
      end

      def import!
        import reviewers
      end

      def reviewers
        [].tap do |records|
          SOURCE_URLS.values.each do |source_url|
            records.concat Fetchers::Dataclip.new(source_url).records
          end
        end
      end

      private

      def find_user_for_import(reviewer)
        User.find_by_email reviewer.fetch('email')
      end

      def import reviewers
        issues = []
        reviewers.each do |reviewer|
          begin
            user = find_user_for_import(reviewer)
            if user
              unless user.imported_data.fetch('reviewers').include?(reviewer)
                user.imported_data.fetch('reviewers') << reviewer
              end
            else
              user = User.new(password: SecureRandom.hex)
              user.attributes =
                reviewer
                  .select { |k,v| User.new.attributes.keys.include?(k) }
                  .merge imported_data: { reviewers: [reviewer] }
            end
            user.save
            unless user.persisted?
              raise [user.errors.to_a, user].inspect
            end
          rescue => e
            issues << e.message
          end
        end
        puts issues.join("\n\n")
      end

    end
  end
end
