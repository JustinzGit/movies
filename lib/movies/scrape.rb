class Scrape
  def self.scrape_theaters(zip_code)
    doc = Nokogiri::HTML(open("https://www.moviefone.com/showtimes/#{zip_code}/#{zip_code}/theaters/"))
    
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
  
  def self.scrape_movies(theater_url)
    theater_page = Nokogiri::HTML(open(theater_url))
    theater_page.css(".movie-listing").each do |movie_entry|
      movie = Movie.new
      movie.name = movie_entry.css(".movietitle").text
      movie.show_times = movie_entry.css(".showtime-display").text.gsub("m", "m ")
    end 
  end
end 