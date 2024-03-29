class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :customer_attributes =>[:first_name, :middle_name, :last_name, :company, :ci, :date_of_birth, :gender, :address, :city_id, :phone, :cell_phone])
    end
  end

  #def after_sign_in_path_for(resource)

  #  "http://www.google.com" # <- Path you want to redirect the user to.
  #end

end
