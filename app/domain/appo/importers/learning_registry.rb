require "learning_registry"

module Appo
  module Importers
    class LearningRegistry

      def self.import_data_file!(data_file)
        num_records = ::LearningRegistry::Extractor.new(data_file).record_count
        num_jobs = 100
        (1..num_jobs).each do |line_number|
          LearningRegistryImportJob.perform_async(
            data_file,
            line_number,
            num_jobs,
            num_records)
        end
      end

      def self.import_line_number!(data_file, line_number)
        line =
          ::LearningRegistry::Extractor
            .read_line_via_keyfile(data_file, line_number)

        import!(line)
      end

      def self.import!(line)
        item = Item.new(line)
        raise BogusItem if item.bogus?

        resource = ResourceFactory.new(item.url).resource_with_data_fetch
        resource.oer = true
        resource.visibility = "public"
        resource.learning_registry[item.id] = item.data

        if resource.new_record?
          resource.flags[:created_by_learning_registry] = true
        end

        resource.save! if resource.changed?
      end

      class Item
        HTTP_REGEX = %r{^https?://.+}i

        def initialize(json)
          @item = JSON.parse(json)
        end

        def resource
          @resource ||= @item.fetch("record").fetch("resource_data")
        end

        def id
          resource.fetch("_id")
        end

        def url
          resource.fetch("resource_locator")
        end

        def bogus?
          !resource.key?("resource_locator") ||
            id.nil? ||
            url.nil? ||
            url == "http://my.resource.locator" ||
            !(url =~ HTTP_REGEX)
        end

        def data
          resource.slice *%w(_id keys)
        end
      end

      class BogusItem < StandardError ; end

    end
  end
end
