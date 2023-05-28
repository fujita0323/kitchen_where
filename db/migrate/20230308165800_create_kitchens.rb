class CreateKitchens < ActiveRecord::Migration[6.1]
  def change
    create_table :kitchens do |t|
      t.integer :genre_id
      t.integer :maker_id
      t.string :name
      t.text :introduction
      t.integer :price
      t.text :title
      t.text :body
      t.timestamps
    end
  end
end
