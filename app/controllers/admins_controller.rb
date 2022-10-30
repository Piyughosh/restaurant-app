class AdminsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @admin_orders = Order.all
    @rest = current_admin.restaurants    
  end
  def show
    @admin_order = Order.find(params[:id])
  end
end
