class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :html_tag_id

  def html_tag_id instance
    instance.class.name.downcase+"_"+instance.id.to_s
  end

end
