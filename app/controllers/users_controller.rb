class UsersController < ApplicationController
  
  def index
    if params[:search].present?
      if current_user
        @users = User.near(params[:search], 100).where.not("id = ?",current_user.id).order("created_at DESC")
      else
        @users = User.all
      end
      @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.infowindow user.first_name
      end
      @header = "Locals Nearby"
    else
      @user = User.all
      if current_user
        @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
      else
        @users = User.all
      end
      @user_locs = @users.where.not(latitude: nil)
      @hash = Gmaps4rails.build_markers(@user_locs) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.infowindow [user.first_name, user.last_name].join(" ")
      end
      @header = "Connect with Locals"
    end
    if current_user
      @conversations = Conversation.involving(current_user).order("created_at DESC")
    end
  end
    
  def edit
    @user = current_user
    @user.geocode
  end

  def show
    @user = User.find(params[:id])
    @user_friends = []
    @user.friendships.where(approved: true).each do |friendship|
      
      friend = User.find(friendship.friend_id)
      @user_friends << friend
    end
    #user_friends is an array of all the approved friends

    @user_friends = @user_friends.uniq

    # @requested_friends =[]
    # @user.friendships.where(approved: false).each do |friendship|
      
    #   friend = User.find(friendship.friend_id)
    #   @requested_friends << friend
    # end
    # #requested friends is the friends that the current user has requested but they have not accepted
    # @requested_friends = @requested_friends.uniq
  
    @reviews = @user.reviews
    @review = Review.new
    @conversations = Conversation.involving(current_user).order("created_at DESC")
  

    @hash = Gmaps4rails.build_markers(@user_friends) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.infowindow [user.first_name, user.last_name].join(" ")
      end
  end

  def address
    current_user.location 
  end

  def update
    @user = current_user
    @user.geocode
    if @user.update_attributes(user_from_params)
      redirect_to "/users/#{@user.id}#profile"
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
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :birthdate, :location, :bio, :interests, :emer_contact, :emer_phone, :emer_first, :emer_last, :emer_relation, :emer_address, :latitude, :longitude, :address, :faves, :tips)
  end

end
