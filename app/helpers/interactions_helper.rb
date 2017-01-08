module InteractionsHelper
  def user_likes?(ref)
    cookies[:likes] && cookies[:likes].include?(ref)
  end
end
