require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(Name)
  csv << csv_column_names
  @genres.each do |genre|
    csv_column_values = [
      genre.name
    ]
    csv << csv_column_values
  end
end
