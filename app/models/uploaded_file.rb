class UploadedFile < ActiveRecord::Base
  include InitializeUUID

  mount_uploader :file, FileUploader

  attr_accessor :megabyte_limit
  belongs_to :user

  validates :file, presence: true
  validates :sha256, presence: true
  validate :validate_file_size

  before_save :set_url

  def file=(f)
    super.tap do
      generate_and_set_sha256
    end
  end

  def remote_file_url=(url)
    super.tap do
      generate_and_set_sha256
    end
  end

  private

  def set_url
    self.url = [
      file.asset_host,
      file.store_dir,
      file.filename
    ].compact.join("/")
  end

  def generate_and_set_sha256
    self.sha256 = file.present? ? generate_sha256 : nil
  end

  def generate_sha256
    sha256 = Digest::SHA256.new

    File.open(file.path, 'rb') do |f|
      while chunk = f.read(64)
        sha256 << chunk
      end
    end

    sha256.hexdigest
  end

  def validate_file_size
    if megabyte_limit.present? && file_size > megabyte_limit
      errors.add(:file, "cannot be larger than #{megabyte_limit}MB")
    end
  end

  def file_size
    file.file.size.to_f/(1024*1024)
  end
end
