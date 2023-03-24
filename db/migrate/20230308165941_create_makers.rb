class CreateMakers < ActiveRecord::Migration[6.1]
  def change
    create_table :makers do |t|
      t.integer :genre_id
      t.string :name
      t.text :introduction

      t.timestamps
    end
  end
end
