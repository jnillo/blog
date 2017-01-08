module Interactions
  extend ActiveSupport::Concern

  def cookies_likes(ref)
    if cookies[:likes].nil?
      cookies[:likes] = {
        value: ref,
        expires: 1.year.from_now,
        httponly: true
      }
    else
      cookies[:likes] += ",#{ref}"
    end
  end
end