# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "samnixa",
             password: "math2468",
             password_confirmation: "math2468",
             admin: true)

50.times do |n|
  Student.create!(name: "user_#{n}",
                  genesis_id: "#{n}",
                  school_id: 1)
end