# Base class application
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Stats

  protect_from_forgery with: :exception
  before_filter :save_visit
end
