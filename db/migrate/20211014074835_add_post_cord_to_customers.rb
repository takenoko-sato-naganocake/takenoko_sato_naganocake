class AddPostCordToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :post_cord, :string
  end
end
