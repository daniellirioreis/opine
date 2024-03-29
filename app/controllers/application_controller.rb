require "application_responder"
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  responders :flash
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  protected

  def layout_by_resource
    devise_controller? ? "login" : "application"
  end


  def after_sign_in_path_for(resource)
    home_path
  end

end
