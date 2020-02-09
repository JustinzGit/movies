# My CLI controller

class MovieController
  
  def call
    Scrape.new.scrape_theaters
    # puts "Welcome to Movie Finder!"
    # puts "The CLI that searches for movies playing in your area."
    # puts "Enter your zip code to list theaters: "
    # theater_list
    # movie_list
  end
  
  def theater_list
    # want each with index -- theater.name, theater.location 
    puts "1. REGAL EDWARDS GREENWAY GRAND PALACE SCREENX & RPX -- 3839 Weslayan, Houston, TX 77027"
    puts "2. AMC HOUSTON 8 -- 510 Texas Street, Houston, TX 77002"
  end 
  
  def movie_list
    puts "Select a movie theater to list movies currently playing."
    puts "To re-enter a zip code type 'menu'"
    puts "To exit Movie Finder type 'exit'"
    
    # want an array to select from
    input = gets.strip
    case input
    when "1"
      puts "movie info on theater 1"
    when "2"
      puts "movie info on theater 2"
    when "menu"
      call
    else
      puts "Invalid input!"
      movie_list
    end 
  end 
end 