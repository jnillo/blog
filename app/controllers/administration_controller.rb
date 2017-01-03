# Administration class controller
class AdministrationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :current_section

  private

  def check_user
    @user = true if user_logged || exist_user
    if @user
      set_cookies_session
    else
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end

  def set_cookies_session
    cookies.signed[:username] = true
    cookies.signed[:session_expired] = Time.zone.now + 30.minutes
    cookies.signed[:httponly] = true
  end

  def user_logged
    cookies.signed[:username].present? &&
      cookies.signed[:session_expired] &&
      cookies.signed[:session_expired] >= Time.zone.now
  end

  def exist_user
    params['user'] == ENV['CREDENTIALS']
  end

  def current_section
    @section = params[:controller].split('/').last
  end
end
