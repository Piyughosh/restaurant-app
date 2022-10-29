# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :check_retaurant, only: :index
  def index
    @q = Restaurant.ransack(params[:q])
    @restaurants = if params[:q].present?
                     Restaurant.includes(:dishes).where(dishes: { name: params[:q]['name_cont'] })
                   else
                     Restaurant.all
                   end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_admin.restaurants.new(restaurant_params)

    if @restaurant.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      @review = @restaurant.reviews.build(review_params)
      @review.save
      redirect_to @restaurant
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to root_path, status: :see_other
  end

  def review
    @reviews = Review.where(comment_type: 'Restaurant')
  end

  def restaurant_status
    @restaurant = Restaurant.find(params[:id])
    RestaurantStatusJob.set(wait: 5.seconds).perform_later(@restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :email, :address, :visibility, :restaurant_image)
  end

  def review_params
    params.require(:restaurant).require(:review).permit(:user_id, :review)
  end

  def check_retaurant
    if admin_signed_in? && Restaurant.find_by(admin_id: current_admin.id).nil?
      redirect_to new_restaurant_path
    elsif admin_signed_in?
      redirect_to admins_path
    end
  end
end
