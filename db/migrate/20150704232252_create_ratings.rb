class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating_number, null: false
      t.text :review, null: false

      t.timestamps null: false
    end
  end
end
