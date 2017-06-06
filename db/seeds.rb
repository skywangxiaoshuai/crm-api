# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# 地区
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'districts.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1:UTF-8')
# csv.each do |row|
#   d = District.new
#   d.id = row['id']
#   d.parent_id = row['parent_id']
#   d.name = row['name']
#   d.save!
#   #puts "#{d.id}, #{d.parent_id}, #{d.name}, #{d.updated_at}, #{d.created_at} saved"
# end
#
# puts "#{District.count} rows districts are seeded"
#
# # 商铺类型
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'categories.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1:UTF-8')
# csv.each do |row|
#   d = Category.new
#   d.id = row['id']
#   d.parent_id = row['parent_id']
#   d.name = row['name']
#   d.save!
#   #puts "#{d.id}, #{d.parent_id}, #{d.name}, #{d.updated_at}, #{d.created_at} saved"
# end
#
# puts "#{Category.count} rows districts are seeded"

# 商铺类型
csv_text = File.read(Rails.root.join('lib', 'seeds', 'towns.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1:UTF-8')
csv.each do |row|
  d = District.new
  d.id = row['id']
  d.parent_id = row['parent_id']
  d.name = row['name']
  d.save!
  #puts "#{d.id}, #{d.parent_id}, #{d.name}, #{d.updated_at}, #{d.created_at} saved"
end

puts "#{District.count} rows districts are seeded"
