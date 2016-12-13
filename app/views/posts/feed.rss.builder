#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Blog de Patricia Carmona"
    xml.author "Patricia Carmona"
    xml.description "Analísta de Social Media"
    xml.link "http://www.patriciacarmona.com"
    xml.language "es"

    for post in @posts
      xml.item do
        xml.title post.title
        xml.author "Patricia Carmona"
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link "http://www.patriciacarmona.com/" + post.slug
        xml.guid post.id

        text = post.content
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.
        unless post.image.url.nil?
            image_url = post.image.url
            image_align = "center"
            image_caption=post.title
            image_tag = "
                <p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' /></p>
              "
            text = text.sub('{image}', image_tag)
        end
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end