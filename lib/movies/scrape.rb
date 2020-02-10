class Scrape
  attr_accessor :doc
  
  def initialize
    @doc = Nokogiri::HTML(open("https://www.moviefone.com/showtimes/houston-tx/77054/theaters/"))
  end
  
  def scrape_theaters
    @doc.css(".theater").each do |theater_entry|
      theater = Theater.new
      theater.name = theater_entry.css("a.theater-name").text
      theater.location = theater_entry.css("p.address a").text
      theater.phone_number = theater_entry.css("p.address .theater-phone").text
      theater.url = theater_entry.css("a.theater-name")[0]["href"]
    end
    binding.pry
  end 
  
  
  
  
  # This goes through all 72 movies 
  def scrape_movies
    @doc.css(".theater .movie-listing").each do |movie_entry|
      movie = Movie.new
      movie.name = movie_entry.css(".movietitle").text
      movie.show_times = movie_entry.css(".showtimes-list .showtime-display").text
      theater.movies << movie
    end
  end 
  

  
end 