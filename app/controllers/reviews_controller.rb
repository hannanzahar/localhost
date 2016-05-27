class ReviewsController < ApplicationController
 
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @reviewed_user_id = params[:reviewer_id]
  end
  
  def create 
    @review = current_user.reviews.create(review_params)
     respond_to do |format|
     format.html { redirect_to user_path(params[:review][:reviewed_user]), notice: 'Reviews was successfully create.' }
     format.json { head :no_content }
    end
  end

  def edit
    @user = current_user
    @review = Review.find_by(id: params[:id])
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def destroy
    @review = Review.find_by(id: params[:id])
     if @review.present?
      @review.destroy
     respond_to do |format|
     format.html { redirect_to user_reviews_url, notice: 'Reviews was successfully destroyed.' }
     format.json { head :no_content }
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:comment, :star, :reviewed_user, :user_id)
  end
end