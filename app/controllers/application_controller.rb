class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_categories
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def authenticate_editor!
    redirect_to root_path unless user_signed_in? && current_user.is_editor?
  end

  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end

  private

  def set_categories
    @categories = Category.all
  end
end
