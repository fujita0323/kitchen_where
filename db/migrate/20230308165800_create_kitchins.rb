class CreateKitchins < ActiveRecord::Migration[6.1]
  def change
    create_table :kitchins do |t|
      t.integer :genre_id
      t.integer :maker_id
      t.string :name
      t.text :introduction
      t.integer :price
      
      t.timestamps
    end
  end
end
