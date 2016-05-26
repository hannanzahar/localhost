class ReviewsController < ApplicationController
 
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end
  
  def create 
    @review = current_user.reviews.create(review_params)
     respond_to do |format|
     format.html { redirect_to reviews_url, notice: 'Reviews was successfully create.' }
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
     format.html { redirect_to reviews_url, notice: 'Reviews was successfully destroyed.' }
     format.json { head :no_content }
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:comment, :star)
  end
end