class UsersController < ApplicationController
  
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_from_params)
        redirect_to path
      else
        flash[:warning] = "User not updated"
      end
  end

  def delete
    @user = User.find
  end
end
