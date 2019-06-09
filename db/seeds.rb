# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'i18n'
require 'faker'
Faker::Config.locale = :en

# 登録特にいらないで使ってもらうためのユーザー
user = User.new(
  email: 'testuser@gmail.com',
  password: 'testtest',
)
user.save!

# dev用ユーザー
user = User.new(
  email: 'a@gmail.com',
  password: 'aaaaaa',
)
user.save!

# その他ユーザー
10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10),
  )
  user.save!
end


50.times do |num|
  book = Book.new(
    title: Faker::Book.title,
    publish_on: (Time.zone.now + Random.rand(0..10000)).to_s,
    sheets: Random.rand(60..500),
    price: Random.rand(1000..7000),
    image: open("#{Rails.root}/app/assets/images/book_sample#{Random.rand(0..2)}.jpg"),
  )
  book.save!(validate: false)
  User.find(Random.rand(1..12)).regist_books.create!(book_id: book.id)
end

25.times do |num|
  user = User.find(Random.rand(1..12))
  user.recommends.create!(
    name: Faker::Book.title,
    summary: Faker::GreekPhilosophers.quote
  )
  3.times {
    Group.create!(
      recommend_id: user.recommends.last.id,
      book_id: Random.rand(1..Book.all.count)
    )
  }
end
