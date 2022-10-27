class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :email
      t.boolean :visibility
      t.belongs_to :admin
      t.timestamps
    end
  end
end
