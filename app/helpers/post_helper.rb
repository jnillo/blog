include ERB::Util
# Methods to base helper of the post instances
module PostHelper
  TWITTER_SHARE_URL='https://twitter.com/intent/tweet?'
  FACEBOOK_SHARE_URL='https://www.facebook.com/sharer/sharer.php?'
  LINKEDIN_SHARE_URL = "https://www.linkedin.com/shareArticle?"
  GOOGLE_SHARE_URL = "https://plus.google.com/share?"

  def show_shares(shares, social_network)
    if shares[social_network]
      shares[social_network].uniq.count
    else
      0
    end
  end

  def build_post_url(post)
    return 'http://patriciacarmona.com/'+post.slug
  end

  def build_share_twitter_url(post)
    twitter_url = TWITTER_SHARE_URL + "url=#{meta_link(post.slug)}"
    twitter_url += '&text='+post.title
    twitter_url += '&via=patricrp'
    twitter_url += '&hashtags='+post.category.name.gsub(' ','')
    twitter_url += ',' + post.tags
    twitter_url
  end

  def build_share_facebook_url(post)
    facebook_url = FACEBOOK_SHARE_URL + "u=#{meta_link(post.slug)}"
    facebook_url += '&picture=' + meta_image(post.image.url)
    facebook_url += '&title=' + url_encode(post.title)
    facebook_url += '&description=' + url_encode(post.resume)
    facebook_url
  end

  def build_share_linkedin_url(post)
    linkedin_url = LINKEDIN_SHARE_URL + "mini=true&url=#{meta_link(post.slug)}"
    linkedin_url += '&title=' + url_encode(post.title)
    linkedin_url += '&picture=' + meta_image(post.image.url)
    linkedin_url += '&summary=' + url_encode(post.resume)
    linkedin_url += '&source=' + url_encode(post.author)
    linkedin_url
  end

  def build_share_google_url(post)
    GOOGLE_SHARE_URL+ "url=" + meta_link(post.slug)
  end

  def meta_image(image)
    url_encode("http://www.patriciacarmona.com#{image}")
  end

  def meta_link(slug)
    url_encode("http://www.patriciacarmona.com/#{slug}")
  end
end
