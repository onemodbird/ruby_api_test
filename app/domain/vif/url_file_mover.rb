module Vif
  module UrlFileMover
    module_function

    def move(url, content_block)
      resource = content_block.resource
      remote_file_url = Vif.absolute_url(url)

      new_uploaded_file =
        UploadedFile.new(
          remote_file_url: remote_file_url,
          user_id: resource.user_id || Appo::Constants::NIL_UUID,
          imported_data: {
            content_block_id: content_block.id,
            resource_id: resource.id,
            resource_kind: resource.kind,
            viflearn_k2_item_id: resource.viflearn_k2_item_id,
            original_url: url,
            absolute_url: remote_file_url
          }
        )

      existing_uploaded_file =
        UploadedFile
          .where(sha256: new_uploaded_file.sha256)
          .find do |file|
            file.imported_data["content_block_id"] == content_block.id
          end

      uploaded_file = existing_uploaded_file || new_uploaded_file
      uploaded_file.save! unless uploaded_file.persisted?
      uploaded_file
    end
  end
end
