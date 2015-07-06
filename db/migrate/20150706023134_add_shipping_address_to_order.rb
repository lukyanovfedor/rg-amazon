class AddShippingAddressToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_address_id, :integer
    add_foreign_key :orders, :addresses, column: :shipping_address_id
    add_index :orders, :shipping_address_id
  end
end
