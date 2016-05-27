class UsersController < ApplicationController
  


  def index
    
    if params[:search].present?
      @users = User.near(params[:search], 100).where.not("id = ?",current_user.id).order("created_at DESC")
      @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.infowindow user.first_name
      end
    else
      @user = User.all
      @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
      @user_locs = @users.where.not(latitude: nil)
      @hash = Gmaps4rails.build_markers(@user_locs) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.infowindow user.first_name
      end
    end
   @conversations = Conversation.involving(current_user).order("created_at DESC")

  end

  def edit
    @user = current_user
  end

  def show
     @user = User.find(params[:id])
  end

  def address
      current_user.location
      
  end

  def update
    @user = current_user

    @user.geocode
    if @user.update_attributes(user_from_params)
      
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
