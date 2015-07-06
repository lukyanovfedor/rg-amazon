class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :descirption
      t.float :price, null: false
      t.integer :books_in_stock, default: 0

      t.timestamps null: false
    end
  end
end
