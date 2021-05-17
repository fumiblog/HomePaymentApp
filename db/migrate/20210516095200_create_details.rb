class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.time :day
      t.integer :payment_method
      t.integer :category_id
      t.string :memo

      t.timestamps
    end
  end
end
