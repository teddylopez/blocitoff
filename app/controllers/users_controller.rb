class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id] || current_user.id)
  end

end
