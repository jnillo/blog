# Base class application
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Stats

  protect_from_forgery with: :exception
  before_action :save_visit, :start_user

  def start_user
  	session[:user_ip] ||= request.remote_ip
  end

  def user_logged
    cookies.signed[:username].present? &&
      cookies.signed[:session_expired] &&
      cookies.signed[:session_expired] >= Time.zone.now
  end

end
