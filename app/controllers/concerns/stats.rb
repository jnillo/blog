module Stats
  extend ActiveSupport::Concern

  def save_visit
  	save_visit_data if new_visit? && !user_logged
  	#add_cookies
  end

  def save_visit_blog(post_id)
    StatData.save_visit_blog(user_ip, post_id) unless user_logged
  end

  def save_visit_data
    StatData.save_visit(Time.zone.now.to_date, user_ip) unless user_logged
  end

  def add_cookies
  	cookies[:home] = {
      value: Time.zone.now.to_date,
      expires: 30.days.from_now,
      httponly: true
    }
  end

  def save_share(post_id, social_network)
    StatData.safe_share_post(post_id, session[:user_ip], social_network)
  end

  # Get visit data:

  def new_visit?
    request.referrer.nil? || !request.referrer.include?(default_url_options[:host])
  end

  def user_ip
    request.remote_ip
  end
end