class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :total_price, null: false
      t.string :state, null: false
      t.datetime :completed_at, null: false

      t.timestamps null: false
    end
  end
end
