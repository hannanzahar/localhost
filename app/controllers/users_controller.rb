class UsersController < ApplicationController
  def index
    @user = User.all 
  end

  # def new
  #   @user = user_from_params
  #  render template: "users/new"
  # end

  def edit
    @user = current_user
  end

  # def create
  #   @user = user_from_params

  #  if @user.save
  #    #redirect_back_or url_after_create
  #  else
  #    render template: "users/new"
  #  end
  # end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_from_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def delete

  end



  private

  def user_from_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :birthdate, :location, :bio, :interests, :emer_contact, :emer_phone, :emer_first, :emer_last, :emer_relation, :emer_address)
  end

end
