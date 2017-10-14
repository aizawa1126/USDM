class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  include SessionsHelper

  helper_method :html_tag_id

  def html_tag_id instance
    instance.class.name.downcase+"_"+instance.id.to_s
  end

  def has_read_operation
    redirect_to(root_url) unless has_operation?("read", @specification)
  end
end
