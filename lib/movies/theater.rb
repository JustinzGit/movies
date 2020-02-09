class Theater 
  attr_accessor :name, :location, :distance, :phone_number, :movies
  
  @@all = []
  
  def initialize(name, location, distance, phone_number)
    @name = name
    @location = location
    @distance = distance
    @phone_number = phone_number
    @@all << self
  end 
  
  def theaters_by_zipcode
    # returns list of theaters via zipcode
    
    # scrape site based on zipcode and populate 
    @name = name
    @location = location
    @@all << self
  end 
  
  def movies_by_theater
    # returns list of movies playing at that theater
  end 
  
  def self.clear
    # method to clear @@all if a new zipcode is inputted
  end 
  
end 