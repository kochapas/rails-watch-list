# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Destroy Everything 🔫👽'
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts 'Create Movies 🎥'
dict = JSON.parse(URI.open("http://tmdb.lewagon.com/movie/top_rated").read)
dict['results'].each do |result|
  Movie.create(title: result['title'], overview: result['overview'],
                poster_url: "https://image.tmdb.org/t/p/w500/#{result['poster_path']}", rating: result['vote_average'])
end

puts 'Create Lists 📃'
lists = []
7.times do
  list = List.new(name: "#{Faker::Name.first_name}'s favorite")
  lists << list if list.save
end

puts 'Create Bookmarks 🔖'
movies = Movie.all
bm_count = 0
lists.each do |list|
  12.times do
    bm = Bookmark.new
    bm.comment = Faker::Restaurant.review.split('.')[0]
    bm.list = list
    bm.movie = movies.sample
    bm_count += 1 if bm.save
  end
end

puts "Seeded 🌲 #{movies.count} Movies, #{lists.count} Lists, #{bm_count} Bookmarks..."
