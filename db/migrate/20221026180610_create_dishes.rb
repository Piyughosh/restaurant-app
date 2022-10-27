class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :price
      t.string :description
      t.belongs_to :restaurant
      t.timestamps
    end
  end
end
