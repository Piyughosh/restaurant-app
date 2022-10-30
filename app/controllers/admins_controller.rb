class AdminsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @admin_orders = Order.all
    @rest = current_admin.restaurants    
  end
  def show
    @dishes = Dish.where(restaurant_id:(params[:id]))
  end
end
