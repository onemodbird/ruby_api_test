#class ImportLibraryResource < ActiveRecord::Base
#  establish_connection(
#    adapter: "mysql2",
#    host: "127.0.0.1",
#    username: "root",
#    password: "",
#    database: "joomla",
#    encoding: "utf8"
#  )
#  self.table_name = "wlje4_k2_extra_fields_index"
#
#  def self.import!
#    LibraryResource.delete_all
#    LibraryResource.reindex!
#
#    find_each do |record|
#      begin
#        LibraryResource.create! json: record.attributes
#      rescue Encoding::UndefinedConversionError
#        Rails.logger.error "Bad text in #{record.id}"
#        attributes = record.attributes.dup
#        attributes.each do |k,v|
#          begin
#            v.to_json
#          rescue Encoding::UndefinedConversionError
#            attributes[k] = v.encode("UTF-8", "ISO-8859-1", undef: :replace)
#          end
#        end
#        LibraryResource.create! json: attributes
#      end
#    end
#  end
#
#end
