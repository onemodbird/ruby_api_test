class BaseUploader < CarrierWave::Uploader::Base

  def store_dir
    if Rails.env.test?
      "/tmp/carrierwave-test/#{model.id}"
    else
      "#{Rails.env}/uploads/#{model.class.to_s.underscore}/#{model.id}"
    end
  end

  def cache_dir
    Rails.root.join "tmp/carrierwave-cache"
  end

  def move_to_cache
    (Rails.env.development? || Rails.env.test?) ? false : true
  end

end
