class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_categories
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :validate_user_state!, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname avatar avatar_file_name avatar_content_type avatar_file_size avatar_updated_at sex state about])
  end

  def authenticate_editor!
    redirect_to root_path unless user_signed_in? && current_user.editor?
  end

  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end

  def validate_user_state!
    debugger
    redirect_to destroy_user_session_path unless current_user.nil? && current_user.allowed_to_sign_in?
  end

  private

  def set_categories
    @categories = Category.all
  end
end
