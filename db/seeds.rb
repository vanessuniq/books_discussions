# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username:  "Vanessa",
    email: "example@example.org",
    password:              "lovelove",
    password_confirmation: "lovelove",
    admin: true)

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@example.org"
password = "password"
User.create!(username:  name,
      email: email,
      password:              password,
      password_confirmation: password)
end

# books
Book.create!(title:  "Thirteen Reasons Why",
    author: "Jay Asher",
    genre:              "Fictionn",
    description: "Thirteen Reasons Why is a young adult novel written in 2007 by Jay Asher. It is 
    the story of a young high school student as she descends into despair brought on by betrayal 
    and bullying, culminating with her suicide.")

99.times do |n|
name  = Faker::Book.title
author = Faker::Book.author
genre = Faker::Book.genre
description = Faker::Lorem.paragraph
Book.create!(title:  name,
      author: author,
      genre:              genre,
      description: description)
end

# discussions, comments
users = User.order(:created_at).take(10)
5.times do
  content = Faker::Lorem.sentence(word_count: 20)
  users.each do |user|
    user.discussions.create!(content: content, book_id: rand(1..50))
    
  end 

5.times do
  users.each {|user|user.comments.create!(content: Faker::Lorem.sentence(word_count: 20) , discussion_id: rand(1..50)) }
end

end

