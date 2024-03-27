require 'open-uri'
require 'json'

url = "https://tmdb.lewagon.com/movie/top_rated"
image_url_base = 'https://image.tmdb.org/t/p/original'

Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

response = URI.open(url)
data = JSON.parse(response.read)
data["results"].each do |movie|
  Movie.create!(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "#{image_url_base}#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
end
