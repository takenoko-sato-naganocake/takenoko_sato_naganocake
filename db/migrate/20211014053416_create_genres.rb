class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.datetime :creat_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
