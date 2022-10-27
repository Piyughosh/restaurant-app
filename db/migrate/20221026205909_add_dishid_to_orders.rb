class AddDishidToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :dish_id, :integer
    add_column :orders, :restaurant_id, :integer
  end
end
