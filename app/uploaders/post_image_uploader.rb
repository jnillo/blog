class PostImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    'posts/images'
  end

  version :thumb do
    process resize_to_fit: [235, 150]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
