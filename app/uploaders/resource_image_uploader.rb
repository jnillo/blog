class ResourceImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
  def store_dir
    'resource/images'
  end

  version :thumb do
    process resize_to_fit: [400, 200]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
