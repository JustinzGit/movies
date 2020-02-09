class Scrape
  
  def self.scrape_theaters
    doc = Nokogiri::HTML(open("https://www.fandango.com/77054_movietimes?mode=general&q=77054"))
    binding.pry
  end 
  
end 