require "rails_helper"

RSpec.describe ContentBlockModificationJob, type: :job do
  let(:user) { create :user }
  let(:resource) { create :resource, user: user, flags: { trusted: true } }
  let(:content_block) { create :content_block, resource: resource }
  let(:new_content) { "<p>New Content</p>" }

  it "modifies original_content and populates content" do
    expect(content_block.content).to_not eq(new_content)
    expect(content_block.original_content).to_not eq(new_content)

    expect(Vif)
      .to receive(:modify_content)
      .with(content_block.original_content, content_block)
      .and_return(new_content)

    subject.perform(content_block.id)

    content_block.reload
    expect(content_block.content).to eq(new_content)
  end

  describe "handling target=_blank" do
    it "leaves the attribute alone if the link goes offsite" do
      html = '<a href="https://docs.google.com/" target="_blank">Go</a>'
      content_block.update!(original_content: html)

      subject.perform(content_block.id)

      content_block.reload
      expect(content_block.content).to match(/target/)
    end

    it "removes the target attribute if the link is relative" do
      html = '<a href="/" target="_blank">Go</a>'
      content_block.update!(original_content: html)

      subject.perform(content_block.id)

      content_block.reload
      expect(content_block.content).to_not match(/target/)
    end

<<<<<<< HEAD
    it "removes the target attribute if the link is to greenprintmedia.org" do
      html = '<a href="https://www.greenprintmedia.org/go" target="_blank">Go</a>'
=======
    it "removes the target attribute if the link is to viflearn.com" do
      html = '<a href="https://www.viflearn.com/go" target="_blank">Go</a>'
>>>>>>> parent of 0bd3464... customize to greenprintmedia
      content_block.update!(original_content: html)

      subject.perform(content_block.id)

      content_block.reload
      expect(content_block.content).to_not match(/target/)
    end

    it "removes the target attribute if the link is to participate.com" do
      html = '<a href="https://www.participate.com/go" target="_blank">Go</a>'
      content_block.update!(original_content: html)

      subject.perform(content_block.id)

      content_block.reload
      expect(content_block.content).to_not match(/target/)
    end
  end

end
