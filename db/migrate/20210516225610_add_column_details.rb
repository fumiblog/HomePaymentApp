class AddColumnDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :details, :coin, :integer
  end
end
