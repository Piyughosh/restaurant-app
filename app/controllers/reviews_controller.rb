class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
 
  def create
    @review = Review.new(reviews_params)
    @review.save
  end
 

  private
  def reviews_params
    params.require(:review).permit(:review, :dish_id, :user_id)
  end
end
 