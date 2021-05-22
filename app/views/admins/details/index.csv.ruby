require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(Day Category_id Payment_method Memo User_id)
  csv << csv_column_names
  @details.each do |detail|
    csv_column_values = [
      detail.day,
      detail.category_id,
      detail.payment_method,
      detail.coin,
      detail.user_id
    ]
    csv << csv_column_values
  end
end

  