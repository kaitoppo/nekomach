class CreatePostMachinekos < ActiveRecord::Migration[6.1]
  def change
    create_table :post_machinekos do |t|
      t.integer :end_user_id
      t.string :shot_address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.text :caption, null: false

      t.timestamps
    end
  end
end
