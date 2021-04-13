# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
Relationship.destroy_all
User.destroy_all

# Users
User.create!(username:  "johnnyman User", email: "john.doe@example.com", password: "pw123")

99.times do |n|
  username  = Faker::Space.constellation+"#{n+1}"
  email = "example-#{n+1}@example.com"
  password = "pw123"
  User.create!(username: username, email: email, password: password)
end

# Posts
users = User.order(:created_at).take(6)
50.times do
  text = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(text: text) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
