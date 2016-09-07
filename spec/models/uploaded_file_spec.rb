require "rails_helper"

RSpec.describe UploadedFile, type: :model do

  it "calculates and sets the sha256 value of file uploads" do
    begin
      file_contents = SecureRandom.hex
      sha256 = Digest::SHA256.hexdigest(file_contents)
      uploaded_file = UploadedFile.new

      tempfile = Tempfile.new("upload")
      tempfile.write(file_contents)
      tempfile.close

      File.open(tempfile.path) { |f| uploaded_file.file = f }

      expect(uploaded_file.sha256).to eq(sha256)
    ensure
      tempfile.close unless tempfile.closed?
      tempfile.unlink
    end
  end

  it "correctly sets url (without a secondary after_save update query)" do
    uploaded_file = create :uploaded_file
    expect(uploaded_file.url)
      .to eq("/tmp/carrierwave-test/#{uploaded_file.id}/pixel.png")
  end

  it "fails validation on megabyte limit" do
    expect {
      create :uploaded_file, megabyte_limit: 0
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "skips megabyte limit when not defined" do
    file = create :uploaded_file
    expect(file).to be_valid
  end

end
