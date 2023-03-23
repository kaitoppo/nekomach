class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :end_user_id, null: false
      t.integer :post_machineko_id, null: false
      t.timestamps
      t.index [:end_user_id, :post_machineko_id], unique: true
    end
  end
end
