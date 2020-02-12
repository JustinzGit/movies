class Movie
  attr_accessor :name, :show_times, :url, :release_date, :summary, :cast, :producers, :distributors
  
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