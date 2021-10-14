class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :customer_id
      t.integer :postage
      t.integer :billing
      t.integer :payment
      t.string :shipping_name
      t.string :shipping_post_cord
      t.string :shipping_address
      t.integer :status

      t.timestamps
    end
  end
end
