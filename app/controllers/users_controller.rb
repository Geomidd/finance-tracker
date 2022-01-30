class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def portfolio
    @tracked_stocks = current_user.stocks
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
