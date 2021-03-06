require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
csv_text = File.read(Rails.root.join('lib', 'seeds', 'ma-municipalities.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  a = Municipality.new
  a.id = row['objectid']
  a.muni_id = row['muni_id']
  a.name = row['municipal']
  a.save
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'mapc-subregions.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  a = Subregion.new
  a.name = row['SubregionLong']
  a.abbv = row['Subregion']
  a.save
end
