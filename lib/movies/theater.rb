class Theater 
  attr_accessor :name, :location, :distance, :phone_number, :movies, :url
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end

end 