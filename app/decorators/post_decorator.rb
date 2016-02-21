class PostDecorator < Draper::Decorator
  delegate_all
  def category_slug
  	category.slug
  end

  def category_name
    category.name
  end
end