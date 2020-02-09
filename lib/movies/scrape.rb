class Scrape
  
  def self.scrape_theaters
    doc = Nokogiri::HTML(open("https://www.moviefone.com/showtimes/houston-tx/77054/theaters/"))
    
    hash = {}
    
    doc.css(".theater").each do |theater|
      title = theater.css("a.theater-name").text
      hash[title.to_sym] = {
        :location => 
        :distance => 
        :phone_number =>
        :movies
      }
    end
    binding.pry
  end 
  
end 