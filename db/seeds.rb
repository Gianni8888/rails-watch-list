# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning database...'
Movie.destroy_all
puts 'Creating lists'
url = 'http://tmdb.lewagon.com/movie/top_rated?'
movies_string = URI.open(url).read
movies = JSON.parse(movies_string)
movies['results'].each do |movie|
  movie = Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average']
  )
  puts "Created #{movie.title}"
end
puts 'Done!'

lists = ["comedy", "drama", "historical"]

lists.each do |list|
  List.create(
    name: list
  )
end
