# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
john = User.create!(
  username: 'johnnyman',
  email: "john.doe@example.com",
  password: "pw123"
)

jane = User.create!(
  username: 'janelady',
  email: "jane.doe@example.com",
  password: "pw123"
)

Post.create!(
  [
    {
      user: john,
      text: "This is my first post! Neato!",
    },
    {
      user: john,
      text: "This is my second post! Going strong!",
    },
    {
      user: jane,
      text: "This is my first post - hope John follows me!",
    },
    {
      user: jane,
      text: "This is my second post - from Jane!",
    }
  ]
)