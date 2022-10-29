module DishesHelper
  def fetch_email(id)
    User.find(id).email
  end
end
