# Methods to base helper of the navigation
module NavigationHelper
  def active_section(current_section, section)
    'active' if current_section == section
  end
end
