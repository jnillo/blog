module Stats
  extend ActiveSupport::Concern

  def save_visit
  	save_visit_data if new_visit?
  	add_cookies
  end

  def save_visit_blog(post_id)
    StatData.save_visit_blog(user_ip, post_id)
  end

  def save_visit_data
    StatData.save_visit(Time.zone.now.to_date, user_ip)
  end

  def add_cookies
  	cookies[:blog] = { value: Time.zone.now.to_date, expires: 30.days.from_now }
  end

  # Get visit data:

  def new_visit?
    request.referrer.nil? || !request.referrer.include?(default_url_options[:host])
  end

  def user_ip
    request.remote_ip
  end
end