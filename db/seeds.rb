# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

# CSV.foreach('db/genre.csv') do |info|
#   Genre.create(:name => info[0])
# CSV.foreach('db/categories.csv') do |info|
#   Category.create(:name => info[0], :genre_id => info[1], :budget => info[2], :memo => info[3], :user_id => info[4])
CSV.foreach('db/details.csv') do |info|
  Detail.create(:day => info[0], :payment_method => info[1], :category_id => info[2], :coin => info[3], :memo => info[4], :user_id => info[5])
end
