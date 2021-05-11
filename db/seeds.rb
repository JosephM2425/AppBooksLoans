# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def authors_random
    authors = Author.pluck(:id)
    new_arr = []

    (1..authors.size).to_a.sample.times { |_| new_arr << authors.sample }
    new_arr.uniq
end

5.times  do |user|
    a = User.create(email: Faker::Internet.email, password: 123456, 
                    firstName: Faker::Name.first_name, lastName: Faker::Name.last_name,
                    username: Faker::Internet.username, phoneNumber: Faker::PhoneNumber.phone_number,
                    role: 0, theme: 0)
end

100.times do |author|
    a = Author.create(fullName: Faker::Name.name, country: Faker::Address.country)
end

100.times do |book|
    file = (1..10).to_a.sample
    b = Book.new(title: Faker::Book.title, description: Faker::Lorem.paragraph, 
                    publisher: Faker::Book::publisher, edition: 1,
                    isbn: Faker::Lorem.words(number: 6).to_s, quantity: 5, author_ids: authors_random)
    b.pdf_book.attach(io: File.open("app/assets/images/file.pdf"), filename: "file.pdf")
    b.cover.attach(io: File.open("app/assets/images/#{file}.jpg"), filename: "#{file}.jpg")
    b.save
end

User.create(email: 'josephmurillo2425@gmail.com', password: 123456, 
    firstName: 'Joseph', lastName: 'Murillo Rodriguez',
    username: 'josephm2425', phoneNumber: 22222222,
    role: 1, theme: 0)



