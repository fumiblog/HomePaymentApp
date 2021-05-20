class ChangeColumnDetails < ActiveRecord::Migration[6.1]
  def change
    change_column :details, :day, :date
  end
end
