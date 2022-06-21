class UsersController < ApplicationController
  def show
    @user = User.includes(:recipes).find(params[:id])
  end
end
