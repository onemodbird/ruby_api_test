FactoryGirl.define do
  factory :uploaded_file do
    user
    file do
      Rack::Test::UploadedFile.new(
        Rails.root.join("spec/fixtures/pixel.png"))
    end
  end
end
