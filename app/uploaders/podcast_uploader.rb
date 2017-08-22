class PodcastUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    'podcasts/files'
  end

  def extension_whitelist
    %w(mp3)
  end
end