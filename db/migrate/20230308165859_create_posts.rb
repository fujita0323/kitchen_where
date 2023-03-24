class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :comment_id
      t.text :review
      t.string :evaluation
      
      t.timestamps
    end
  end
end
