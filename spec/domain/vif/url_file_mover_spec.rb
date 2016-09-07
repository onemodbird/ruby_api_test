require "rails_helper"

module Vif
  describe UrlFileMover do
    let(:url) { Addressable::URI.parse(Faker::Internet.url).path }
<<<<<<< HEAD
    let(:absolute_url) { "https://www.greenprintmedia.org#{url}" }
=======
    let(:absolute_url) { "https://www.greenprintmedia.org#{url}" }
>>>>>>> parent of 0bd3464... customize to greenprintmedia
    let(:user) { create :user }
    let(:resource) do
      create :resource,
        user: user,
        viflearn_k2_item_id: rand(1..9999)
    end
    let(:content_block) { create :content_block, resource: resource }
    let(:imported_data) {{
      content_block_id: content_block.id,
      resource_id: resource.id,
      resource_kind: resource.kind,
      viflearn_k2_item_id: resource.viflearn_k2_item_id,
      original_url: url,
      absolute_url: absolute_url
    }}
    let(:body) { SecureRandom.hex }
    let(:body_sha256) { Digest::SHA256.hexdigest(body) }
    let(:uploaded_file) { UploadedFile.find_by(sha256: body_sha256) }

    before :each do
      stub_request(:get, absolute_url).and_return(status: 200, body: body)
    end

    it "creates an UploadedFile from the given url" do
      expect(UploadedFile)
        .to receive(:new)
        .with(
          remote_file_url: absolute_url,
          user_id: user.id,
          imported_data: imported_data
        )
        .and_call_original

      new_uploaded_file = UrlFileMover.move(url, content_block)

      expect(uploaded_file.url).to eq(new_uploaded_file.url)
      expect(uploaded_file.file.url).to eq(new_uploaded_file.url)
      expect(uploaded_file.user_id).to eq(user.id)
      expect(uploaded_file.imported_data.symbolize_keys).to eq(imported_data)
    end

    it "uses Appo::Constants::NIL_UUID if there is no user" do
      resource.update!(user: nil)

      expect { UrlFileMover.move(url, content_block) }.to_not raise_error
      expect(uploaded_file.user_id).to eq(Appo::Constants::NIL_UUID)
    end

    it "checks for an existing uploaded_file" do
      existing_uploaded_file =
        UploadedFile.create!(
          remote_file_url: absolute_url,
          user_id: resource.user_id,
          imported_data: imported_data
        )

      expect { UrlFileMover.move(url, content_block) }
        .to_not change(UploadedFile, :count)

      expect(uploaded_file).to eq(existing_uploaded_file)
    end

  end
end

