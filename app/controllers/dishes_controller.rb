# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :authenticate_user!, only: :show
  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      redirect_to admins_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])
    
    if @dish.update(dish_params)
      @review = @dish.reviews.build(review_params)
      @review.save

      redirect_to @dish
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def review_params
    params.require(:dish).require(:review).permit(:user_id, :review)
  end

  def dish_params
    params.require(:dish).permit(:name, :description, :restaurant_id, :price, :dish_image)
  end
end
