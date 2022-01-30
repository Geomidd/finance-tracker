class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end
end
