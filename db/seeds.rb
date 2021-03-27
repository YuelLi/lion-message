# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [{:username => 'yuankai', :password => '123456', :role => "student", :department => "Computer Science"}]

users.each do |user|
  User.create!(user)
end

departments = [{:name => "Computer Science"},{:name => "Electrical Engineering"},{:name => "Columbia Finance"},{:name => "ISSO"}]

users.each do |user|
  User.create!(user)
end

departments.each do |department|
  Department.create!(department)
end

