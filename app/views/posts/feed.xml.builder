#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", "xmlns:webfeeds" => "http://webfeeds.org/rss/1.0", "xmlns:sy" => "http://purl.org/rss/1.0/modules/syndication/", "xmlns:dc" => "http://purl.org/dc/elements/1.1/", "xmlns:g" => "http://base.google.com/ns/1.0" , "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "Blog de Patricia Carmona"
    xml.description "Analísta de Social Media"
    xml.link "http://www.patriciacarmona.com"
    xml.language "es"
    xml.tag!("sy:updatePeriod","hourly")
    xml.tag!("sy:updateFrequency","1")
    xml.tag!('atom:link', nil, href: 'http://patriciacarmona.com/feed.xml')
    xml.tag!("webfeeds:analytics", nil, {id: ENV['ANALYTICS_CODE'], engine: "GoogleAnalytics"})

    for post in @posts
      xml.item do
        xml.title post.title
        xml.tag!('dc:creator', "Patricia Carmona" )
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link "http://www.patriciacarmona.com/" + post.slug
        xml.guid(post.slug, isPermaLink: false)

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
        xml.description { xml.cdata! "<p>" + text + "</p>" }

      end
    end
  end
end