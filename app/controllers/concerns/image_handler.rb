class ImageHandler
  attr_accessor :content

  def initialize(content, title = nil)
    @content = content
    @title = title
  end

  def parse
    images.each_with_index do |data, index|
      next unless image_new?(data.first.second)
      image_content = data.first
      extension = image_extension(image_content.second[0..100])
      name = Post.generate_internal_link(@title)
      filename = "#{name}-#{index}.#{extension}"
      create_file_assets(file_path(filename), image_content)
      update_content(image_content.second, filename)
    end
  end

  def first_image
    images.present? ? images.first.first.second : nil
  end

  private

  def images
    Nokogiri::HTML(@content).css('img')
  end

  def image_new?(image_content)
    image_content.length > 200
  end

  def create_file_assets(image_path, image_content)
    File.open(image_path, 'wb') do |f|
        f.write(Base64.decode64(image_content.second[image_content.second.split(',').first.length+1..-1]))
    end
  end

  def file_path(filename)
    Rails.root.join('public', 'posts', 'images', filename).to_s
  end

  def update_content(image_content, filename)
    @content.gsub!(image_content, '/assets/' + filename)
  end

  def image_extension(image_info)
    image_info.split(';').first.split('/').last
  end
end