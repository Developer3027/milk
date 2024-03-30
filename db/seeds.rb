# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Devise created users, needs email and password
User.destroy_all
p "Confirmed #{User.count} User records are left."

User.create!([{
  email: "jack@test.com",
  password: "jack456"
}, {
  email: "jess@jess.com",
  password: "jess456"
}])

p "Created #{User.count} users"

# Devise created admin, needs email and password
Admin.destroy_all
p "Confirmed #{Admin.count} admin records are left."

Admin.create!({
  email: "admin@admin.com",
  password: "admin456"
})

p "Created #{Admin.count} admins"

# erudition needs title and description
Erudition.destroy_all
p "Confirmed #{Erudition.count} course records are left."

Erudition.create!([{
  title: "Ruby",
  description: "Short course to get a handle on the Ruby language."
},{
  title: "Rails",
  description: "Short course will give a solid foundation on Rails."
}])

p "Created #{Erudition.count} courses"
