module AdminsHelper
  def fetch_image(dish_id)
    Dish.find(dish_id).dish_image
  end

  def fetch_user_name(id)
    User.find(id).name
  end

  def fetch_restaurant_name(id)
    Restaurant.find(id).name
  end
end