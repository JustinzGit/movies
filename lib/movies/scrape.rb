class Scrape
  
  # Scrapes Moviefone.com page that displays theaters based on location 
  def self.scrape_theaters(zip_code)
    doc = Nokogiri::HTML(open("https://www.moviefone.com/showtimes/#{zip_code}/#{zip_code}/theaters/"))
    
    # Scrapes the first few pages
    doc.css(".page-number").size.times do |page_number|
      page =  Nokogiri::HTML(open("https://www.moviefone.com/showtimes/#{zip_code}/#{zip_code}/theaters/?page=#{page_number}"))
      page.css(".theater").each do |theater_entry|
        theater = Theater.new
        theater.name = theater_entry.css("a.theater-name").text
        theater.distance = theater_entry.css(".mileage").text.strip
        theater.location = theater_entry.css("p.address a").text
        theater.phone_number = theater_entry.css("p.address .theater-phone").text
        theater.url = theater_entry.css("a.theater-name")[0]["href"]
      end
    end 
  end 
  
  # Scrapes collection of movies playing at a chosen theater
  def self.scrape_movies(theater_url)
    theater_page = Nokogiri::HTML(open(theater_url))
    theater_page.css(".movie-listing").each do |movie_entry|
      movie = Movie.new
      movie.name = movie_entry.css(".movietitle").text
      movie.show_times = movie_entry.css(".showtime-display").text.gsub("m", "m ")
      movie.url = movie_entry.css(".movietitle a")[0]["href"]
    end 
  end
  
  # Scrapes additional information about a chosen movie
  def self.scrape_movie_info(movie_url, movie)
    movie_page = Nokogiri::HTML(open(movie_url))
    movie_page.css(".information").each do |movie_info|
      movie.release_date = movie_info.css("p")[0].text
      movie.summary = movie_info.css("p")[2].text
      movie.cast = movie_info.css("p")[3].text
      movie.producers = movie_info.css("p")[6].text
      movie.distributors = movie_info.css("p")[7].text
    end
  end 
end 