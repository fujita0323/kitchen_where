class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :customers_id
      t.text :reaction
      
      t.timestamps
    end
  end
end
