# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create(name: "admin", username: "admin", password: "admin", email: "shalkous@mew.gov.kw")

puts "********Seeding Data Start************"

admin = User.create(:name => "admin", :username => "admin", :password => "admin", :password_confirmation => "admin", :email => "shalkous@mew.gov.kw")

if admin.errors.blank?
    puts "***User #{admin.name} #{admin.username} created ***"
    puts "***admin role assigned to #{admin.name} #{admin.username}***"
else
    puts "admin user failed to create due to below reasons:"
    admin.errors.each do |x, y|
       puts"#{x} #{y}" # x will be the field name and y will be the error on it
     end
end

puts "********Seeding Data End************"
