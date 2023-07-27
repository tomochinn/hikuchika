class ApplicationController < ActionController::Base

  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_recipe

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def set_recipe
    @recipes = Recipe.all
  end
end
