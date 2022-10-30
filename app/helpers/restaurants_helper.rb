module RestaurantsHelper
  def fetch_email(id)
    User.find(id).email
  end

  def restaurant_name(review_id)
    Restaurant.joins(:reviews).where(reviews:{id: review_id}).find_by(admin_id: current_admin.id).name
  end
end
