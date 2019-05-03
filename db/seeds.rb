# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  email: 'a@gmail.com',
  password: 'aaaaaa'
)
user.save!

5.times do |num|
  book = Book.create!(
    title: ['emotion java', 'go lang', 'php hyperapp', 'origin edge server', 'five factor'][num.to_i],
    publish_on: (Time.zone.now + Random.rand(0..10)).to_s,
    sheets: Random.rand(60..500),
    price: Random.rand(1000..7000),
    image: open("#{Rails.root}/app/assets/images/book_sample#{Random.rand(0..2)}.jpg")
  )

  user.regist_books.create!(book_id: book.id)
end

3.times do |num|
  user.recommends.create(
    name: ['advanced linux', 'beginner frontend', 'hyper edge jail'][num.to_i],
    summary: 'summary discription'
  )
end
