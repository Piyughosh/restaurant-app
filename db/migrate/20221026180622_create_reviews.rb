class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :review
      t.references :comment, polymorphic: true
      t.timestamps
    end
  end
end
