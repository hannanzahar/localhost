class WelcomeController < ApplicationController
  def index
  end
   def show
     @users = User.all
      @conversations = Conversation.involving(current_user).order("created_at DESC")
  end
end
