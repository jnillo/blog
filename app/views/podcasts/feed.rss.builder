#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", "xmlns:webfeeds" => "http://webfeeds.org/rss/1.0", "xmlns:sy" => "http://purl.org/rss/1.0/modules/syndication/", "xmlns:dc" => "http://purl.org/dc/elements/1.1/", "xmlns:g" => "http://base.google.com/ns/1.0" , "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "La Analísta del punto com"
    xml.image do
      xml.url "https://patriciacarmona.com" + image_path('author.jpg')
      xml.title "Blog de Patricia Carmona"
      xml.title "https://www.patriciacarmona.com"
    end
    xml.description "Podcast de la Analísta del punto com, dirigído por Patricia Carmona"
    xml.link "https://www.patriciacarmona.com"
    xml.language "es"
    xml.tag!("sy:updatePeriod","hourly")
    xml.tag!("sy:updateFrequency","1")
    xml.tag!('atom:link', nil, { href: 'https://patriciacarmona.com/podcast_feed/', rel:"self" } )
    xml.tag!("webfeeds:analytics", nil, {id: ENV['ANALYTICS_CODE'], engine: "GoogleAnalytics"})
    xml.tag!("itunes:author", "La Analísta del punto com")
    xml.tag!("itunes:summary", "Podcast de la Analísta del com")
    xml.tag!("itunes:owner") do
      xml.tag!("itunes:name", 'Patricia Carmona')
      xml.tag!('itunes:email', 'laanalistadel.com@gmail.com')
    end
    xml.tag!("itunes:explicit", 'no')
    xml.tag!("itunes:image", href: "https://patriciacarmona.com" + image_path('author.jpg'))
    xml.tag!("itunes:category", text: 'Business')
    xml.tag!("itunes:category", text: 'Management & Marketing')


    for podcast in @podcasts
      xml.item do
        xml.title podcast.title
        xml.guid ''
        xml.pubDate podcast.created_at
        xml.lastBuildDate podcast.updated_at
        xml.guid("https://www.patriciacarmona.com" + podcast.file.url, isPermaLink: false)

        xml.description { xml.cdata! "<p>" + podcast.description + "</p>" }
        xml.language 'es'
        xml.category 'Marketing'
        xml.enclosure url: "https://www.patriciacarmona.com" + podcast.file.url, type: "audio/mp3"
        xml.tag!("itunes:summary", podcast.description)
        xml.tag!("itunes:imagehref", "https://patriciacarmona.com" + image_path('author.jpg'))
      end
    end
  end
end
