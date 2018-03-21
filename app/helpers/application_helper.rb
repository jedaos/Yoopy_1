module ApplicationHelper
  def resource_name
    :prof
  end

  def resource
    @resource ||= Prof.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:prof]
  end

end
