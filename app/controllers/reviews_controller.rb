class ReviewsController < ApplicationController
  def new
    @review = Review.new
     redirect_to dish_reviews_path
  end
 
  def create
    if params[:dish_id].nil?
      @restaurant = Restaurant.find(params[:restaurant_id])
      @review = @restaurant.reviews.create(reviews_params)
    else
      @dish = Dish.find(params[:dish_id])
      @review = @dish.reviews.create(reviews_params)
    end
  end
 

  private
  def reviews_params
    params.require(:review).permit(:review, :dish_id, :user_id)
  end
end
 