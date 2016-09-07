class ImportFileAttachmentAsContentBlockJob
  include Sidekiq::Worker
  sidekiq_options queue: "import"

  def perform(resource_id, attachment_id, filename, datetime, position)

    resource = Resource.find(resource_id)
<<<<<<< HEAD
    url = "https://www.greenprintmedia.org/media/k2/attachments/#{filename}"
=======
    url = "https://www.viflearn.com/media/k2/attachments/#{filename}"
>>>>>>> parent of 0bd3464... customize to greenprintmedia

    ContentBlock.transaction do
      uploaded_file =
        UploadedFile.new(
          remote_file_url: url,
          user_id: resource.user_id,
          created_at: datetime)

      return unless uploaded_file.file.present?
      uploaded_file.save!

      ContentBlock.create!(
        resource_id: resource_id,
        kind: "file",
        position: position,
        uploaded_file: uploaded_file,
        viflearn_k2_attachment_id: attachment_id)
    end
  end
end
