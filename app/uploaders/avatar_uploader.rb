class AvatarUploader < BaseUploader
  include CarrierWave::MiniMagick

  process resize_to_fill: [300, 300]
  process convert: 'png'

  def filename
    "#{Time.now.to_i}-avatar.png" if original_filename.present?
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
