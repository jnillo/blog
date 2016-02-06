module Stats
  extend ActiveSupport::Concern

  def save_visit
  	save_visit_data if new_visit?
  	add_cookies
  end

  def save_post_visit
  end

  def add_cookies
  	cookies[:blog] = { value: Time.zone.now, expires: 30.days.from_now }
  end

  # Get visit data:

  def new_visit?
    request.referrer.nil? || !request.referrer.include?("sociack.com")
  end

  def get_ip
    request.remote_ip
  end
end