class AddBillingAddressToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :billing_address_id, :integer
    add_foreign_key :orders, :addresses, column: :billing_address_id
    add_index :orders, :billing_address_id
  end
end
