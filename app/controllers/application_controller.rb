class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  helper_method :current_user

  helper_method :is_admin?
  helper_method :is_current_user?

  def is_admin?
    current_user && current_user.admin
  end

  # def is_current_user?
  #   if current_user
  #     current_user.id == product.user.id
  #   else
  #     false
  #   end
  # end

# Custom parameters / Strong Parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
   end

end
