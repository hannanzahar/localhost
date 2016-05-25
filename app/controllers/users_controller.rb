class UsersController < ApplicationController
  


  def index
    if params[:search].present?
      @user = User.near(params[:search], 100)
    else
      @user = User.all
    end
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

  def address
      current_user.location
      
  end

  def update
    @user = current_user

    @user.geocode
    if @user.update_attributes(user_from_params)
      @user.location 
      redirect_to @user
    else
      render 'edit'
    end
  end

  def delete

  end

  def show_nearby_locations
    @nearbys = User.near("#{params[:address]}", 5,:order => "distance",:units => :km)
    @nearbys.first(10)
  end


  private

  def user_from_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :birthdate, :location, :bio, :interests, :emer_contact, :emer_phone, :emer_first, :emer_last, :emer_relation, :emer_address, :latitude, :longitude, :address)
  end

end
