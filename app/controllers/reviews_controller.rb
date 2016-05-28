class ReviewsController < ApplicationController
 
  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
  end

  # no more no more no mooooooore
  def new
    @review = Review.new
  end
  
  def create 
    @user = User.find(params[:user_id])
    @review = @user.reviews.create(review_params)
     respond_to do |format|
     format.html { redirect_to user_reviews_path(@user), notice: 'Reviews was successfully create.' }
     format.json { head :no_content }
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to user_reviews_path(@review.user)
    else
      render :edit
    end
  end

  def show
    @review = Review.find(params[:user_id])
  end

  def destroy
    @review = Review.find_by(id: params[:id])
     if @review.present?
      @review.destroy
     respond_to do |format|
     format.html { redirect_to user_path(@review.user), notice: 'Reviews was successfully destroyed.' }
     format.json { head :no_content }
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:comment, :star, :reviewer_id)
  end
end