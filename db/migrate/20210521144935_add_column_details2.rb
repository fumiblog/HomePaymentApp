class AddColumnDetails2 < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :user_id, :integer
    add_column :details, :user_id, :integer
  end
end