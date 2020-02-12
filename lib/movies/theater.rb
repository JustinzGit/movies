class Theater 
  attr_accessor :name, :location, :distance, :phone_number, :url
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.clear
    @@all.clear
  end
end 