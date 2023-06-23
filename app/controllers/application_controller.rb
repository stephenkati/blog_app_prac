class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:new, :create]
  protect_from_forgery with: :exception
  respond_to :json

  protected

  def configure_permitted_parameters
    attributes = [:name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "You don't have permission to perform this action."
  end
end
