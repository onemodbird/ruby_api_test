require 'rails_helper'

describe ContentBlock do
  let(:course_resource) { create :resource, :course}

  it "sets position as blocks are added" do
    expect(course_resource.content_blocks.map(&:position)).to eq [1,2,3]
  end

  it "resets positions as blocks are removed" do
    course_resource.content_blocks.find_by!(position: 2).destroy
    expect(course_resource.reload.content_blocks.map(&:position)).to eq [1,2]
  end

  it "doesn't allow an invalid key for an interactive block" do
    discussion = build :content_block, kind: :interactive, key: :nope
    expect(discussion).to_not be_valid
  end

  it "allows a valid key for an interactive block" do
    discussion = build :content_block, kind: :interactive, key: :discussion
    expect(discussion).to_not be_valid
  end

  it "sanitizes html" do
    block = course_resource.content_blocks.create kind: "html", content: dirty_html
    expect(block.content).to eq clean_html
  end

  it "does not sanitize html for 'trusted' resources" do
    course_resource.update_attribute :flags, { trusted: true }
    block = course_resource.content_blocks.create kind: "html", content: dirty_html
    expect(block.content).to eq dirty_html
  end

  it "does not sanitize if the content has not changed" do
    block = course_resource.content_blocks.create kind: "html", content: dirty_html
    expect(block).to_not receive(:sanitize_html)
    block.update!(content: block.content)
  end

end
