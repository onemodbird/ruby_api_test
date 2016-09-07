class ContentBlockModificationJob
  include Sidekiq::Worker
  sidekiq_options queue: "import", retry: false

  def perform(content_block_id)
    cb = ContentBlock.find(content_block_id)
    cb.content = Vif.modify_content(cb.original_content, cb)
    cb.save! if cb.changed?
  end
end
