# Methods to base helper of the applicaton
module ApplicationHelper
  def categories_for_select
    Category.all.map { |category| [category.name, category.id] }
  end

  def home_page?
    params[:controller] == 'home'
  end
end
