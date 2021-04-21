# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [{
          :username => 'yuankai', 
          :password => '123456', 
          :email => 'yk@columbia.edu',
          :role => "student", 
          :department => "Computer Science"
          },
          {
          :username => 'zhangsan',
          :password => '123456',
          :email => 'zs@columbia.edu',
          :role => 'student',
          :department => 'Electrical Engineering'
          },
          {
            :username => 'cs1',
            :password => '123456',
            :email => 'cs1@columbia.edu',
            :role => 'faculty',
            :department => 'Computer Science'
          },
          {
            :username => 'ee1',
            :password => '123456',
            :email => 'ee1@columbia.edu',
            :role => 'faculty',
            :department => 'Electrical Engineering'
          },
          {
            :username => 'amberlee',
            :password => '123456',
            :email => 'amberlee@columbia.edu',
            :role => 'faculty',
            :department => 'Computer Science'
          },
          {
            :username => 'minhezhangmz2864',
            :password => '123456',
            :email => 'mz2864@columbia.edu',
            :role => 'student',
            :department => 'Computer Science'
          }
        ]

users.each do |user|
  User.create!(user)
end

departments = [{:name => "Computer Science"},
               {:name => "Electrical Engineering"},
               {:name => "Columbia Finance"},
               {:name => "ISSO"}]

departments.each do |department|
  Department.create!(department)
end


