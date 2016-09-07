class ContentBlockSerializer < BaseSerializer
  attributes :id, :kind, :title, :position, :content, :key, :uploaded_file
  attributes :updated_at_i, :created_at_i

  def filter(keys)
    if object.uploaded_file.present?
      keys
    else
      keys - [:uploaded_file]
    end
  end

  def uploaded_file
    UploadedFileSerializer.serialize(object.uploaded_file)
  end
end
