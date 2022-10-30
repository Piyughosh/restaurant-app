module OrdersHelper
  def fetch_image(dish_id)
    Dish.find(dish_id).dish_image
  end

  def fetch_name(restaurant_name)
    Restaurant.find(restaurant_name).name
  end
end
