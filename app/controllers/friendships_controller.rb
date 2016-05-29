class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]
  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
  end
  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end
  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end
  # GET /friendships/1/edit
  def edit
  end
  # POST /friendships
  # POST /friendships.json
  def create
    
    @friendship1 = current_user.friendships.build(:friend_id => params[:friend_id], approved: "false")
    @friendship1.original = true
    @user_being_friended = User.find(params[:friend_id])
    @friendship2 = @user_being_friended.friendships.build(:friend_id => current_user.id, approved: "false")
    @friendship2.original = false
    byebug
    if (Friendship.where(friend_id: params[:friend_id], user_id: current_user.id).count != 1)
      if @friendship1.save && @friendship2.save
        flash[:notice] = "Friend requested."
        redirect_to :back
      else
        flash[:error] = "Unable to request friendship."
        redirect_to :back
      end
    else
      flash[:notice] = "Friend requested again."
      redirect_to :back
    end
  end
  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    @friendship1 = Friendship.where(friend_id: current_user.id, user_id: params[:id]).first
    @friendship2 = Friendship.where(friend_id: params[:id], user_id: current_user.id).first
    @friendship1.update(approved: true)
     @friendship2.update(approved: true)
    if @friendship1.save && @friendship2.save
      redirect_to :back, :notice => "Successfully confirmed friend!"
    else
      redirect_to :back, :notice => "Sorry! Could not confirm friend!"
    end
  end
  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
   @friendship1 = Friendship.where(friend_id: current_user.id, user_id: params[:id]).first
    @friendship2 = Friendship.where(friend_id: params[:id], user_id: current_user.id).first
    @friendship1.destroy
    @friendship2.destroy
    flash[:notice] = "Removed friendship."
    redirect_to :back
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :approved)
    end
end
