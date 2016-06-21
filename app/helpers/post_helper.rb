# Methods to base helper of the post instances
module PostHelper
  TWITTER_SHARE_URL='https://twitter.com/intent/tweet?'

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
    twitter_url = TWITTER_SHARE_URL + "url=#{post.external_link}"
    twitter_url += '&text='+post.title
    twitter_url += '&via=patricrp'
    twitter_url += '&hashtags='+post.category.name.gsub(' ','')
  end

  def build_share_facebook_url(post)
    "https://www.facebook.com/sharer/sharer.php?u=#{post.external_link}"
  end

  def build_share_linkedin_url(post)
    "https://www.linkedin.com/shareArticle?mini=true
    &url=#{post.external_link}&title=#{post.title}&summary=#{post.resume}&source=#{post.author}"
  end

  def build_share_google_url(post)
    "https://plus.google.com/share?url=#{post.external_link}"
  end

  def meta_image(image)
    "http://www.patriciacarmona.com#{image}"
  end
end
