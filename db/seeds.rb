# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Destroy Everything 🔫👽"
Movie.destroy_all

puts "Create Movies 🎥"
m1 = Movie.new(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
m2 = Movie.new(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
m3 = Movie.new(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
m4 = Movie.new(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
m1.save
m2.save
m3.save
m4.save

puts "Create Lists 📃"
l1 = List.new(name: "Girl Power")
l2 = List.new(name: "Some Dramatic Movies")
l1.save
l2.save

puts "Create Bookmarks 🔖"
b1 = Bookmark.new(comment: "She's WONDER 💪🌟", list: l1, movie: m1)
b2 = Bookmark.new(comment: "Bunch of badass girls 🚗💃", list: l1, movie: m4)
b3 = Bookmark.new(comment: "🚢 There's enough space for two! 🚪", list: l2, movie: m3)
b4 = Bookmark.new(comment: "I never watch this movie... But it must be good? 👮‍♂️🎭", list: l2, movie: m2)
b1.save
b2.save
b3.save
b4.save

puts "Seeded 🌲"
