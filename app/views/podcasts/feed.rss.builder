#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", "xmlns:webfeeds" => "http://webfeeds.org/rss/1.0", "xmlns:sy" => "http://purl.org/rss/1.0/modules/syndication/", "xmlns:dc" => "http://purl.org/dc/elements/1.1/", "xmlns:g" => "http://base.google.com/ns/1.0" , "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "Blog de Patricia Carmona"
    xml.description "Analísta de Social Media"
    xml.image image_path('author.jpg')
    xml.link "http://www.patriciacarmona.com"
    xml.language "es"
    xml.tag!("sy:updatePeriod","hourly")
    xml.tag!("sy:updateFrequency","1")
    xml.tag!('atom:link', nil, { href: 'http://patriciacarmona.com/podcast_feed.xml', rel:"self" } )
    xml.tag!("webfeeds:analytics", nil, {id: ENV['ANALYTICS_CODE'], engine: "GoogleAnalytics"})

    for podcast in @podcasts
      xml.item do
        xml.title podcast.title
        xml.guid ''
        xml.pubDate podcast.created_at
        xml.lastBuildDate podcast.updated_at
        xml.guid("http://www.patriciacarmona.com" + podcast.file.url, isPermaLink: false)

        xml.description { xml.cdata! "<p>" + podcast.description + "</p>" }
      end
    end
  end
end
