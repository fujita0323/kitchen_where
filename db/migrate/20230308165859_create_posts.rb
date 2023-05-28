class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.text :review
      t.float :star
      t.integer :kitchen_id


      t.timestamps
    end
  end
end
