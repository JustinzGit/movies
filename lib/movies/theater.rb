class Theater 
  attr_accessor :name, :location, :movies
  
  @@all = []
  
  def initialize(name, location)
    @name = name
    @location = location
    @@all << self
  end 
  
  def theaters_by_zipcode
    # returns list of theaters via zipcode
  end 
  
  def movies_by_theater
    # returns list of movies playing at that theater
  end 
  
end 