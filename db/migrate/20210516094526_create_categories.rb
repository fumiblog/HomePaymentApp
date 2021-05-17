class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :genre_id
      t.integer :budget

      t.timestamps
    end
  end
end
