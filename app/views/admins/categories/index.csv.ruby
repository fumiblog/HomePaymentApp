require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(Name Genre_id Budget Memo User_id)
  csv << csv_column_names
  @categories.each do |category|
    csv_column_values = [
      category.name,
      category.genre_id,
      category.budget,
      category.memo,
      category.user_id
    ]
    csv << csv_column_values
  end
end
