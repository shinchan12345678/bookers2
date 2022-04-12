class ApplicationController < ActionController::Base
# 　bundle exec rspec spec/ --format documentation -o rspec.log
  before_action :authenticate_user!, except: [:top,:about]
  # before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters,if: :devise_controller?

  def after_sign_up_path_for(resource)
    if user_signed_in?
      user_path(current_user)
    else
      new_user_registration_path
    end
  end



  def after_sign_in_path_for(resource)
    if user_signed_in?
      user_path(current_user)
    else
      new_user_session_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:email])
    # devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in,keys: [:name])
  end
end