class Movie
  attr_accessor :name, :show_times
  
   @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end
end 