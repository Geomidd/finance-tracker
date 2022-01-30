class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if @friends
        render partial: "users/friend"
      else
        error = "Could not find user"
        render partial: "users/friend_error", locals: {error: error}
      end
    else
      error = "Please enter a name or email to search"
      render partial: "users/friend_error", locals: {error: error}
    end
  end
end
