class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth
  # before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource) 
    root_path
  end

  private
  

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'bbbb' && password == '1111'
    end
  end
end
