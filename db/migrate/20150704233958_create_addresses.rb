class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address, null: false
      t.string :zipcode, null: false
      t.string :city, null: false
      t.string :phone, null: false

      t.timestamps null: false
    end
  end
end
