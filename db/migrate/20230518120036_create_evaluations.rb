class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.integer :kitchen_id
      t.integer :post_id
      t.float :star
      t.timestamps
    end
  end
end
