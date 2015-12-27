# Base class application
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def check_user
    @user = true if user_logged || exist_user
    if @user
      set_cookies_session
    else
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end

  def set_cookies_session
    cookies.signed[:username] = true
    cookies.signed[:session_expired] = Time.now + 30.minutes
  end

  def user_logged
    cookies.signed[:username].present? &&
    cookies.signed[:session_expired] &&
    cookies.signed[:session_expired] >= Time.now
  end

  def exist_user
    params['user'] == ENV['CREDENTIALS']
  end
end
