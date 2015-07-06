class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :number, null: false 
      t.integer :CVV, null: false
      t.integer :expiration_month, null: false
      t.integer :expiration_year, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.timestamps null: false
    end
  end
end
