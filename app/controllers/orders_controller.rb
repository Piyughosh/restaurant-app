class OrdersController < ApplicationController
  after_action :create, only: :new
  def index
    @orders =Order.where(user_id:current_user)
  end
  def show
    @order = Order.find(params[:id])
    @reviews = Review.all
    @order = Order.find(params[:id])
  end 
  def new
    @order = Order.new()
    redirect_to action: :create
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save    
    else
      render :new, status: :unprocessable_entity
    end
  end

  def order_params
    params.require(:order).permit(:name, :description, :dish_id, :restaurant_id, :price)
   end
end
