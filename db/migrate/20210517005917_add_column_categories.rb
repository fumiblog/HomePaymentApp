class AddColumnCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :memo, :string
  end
end
