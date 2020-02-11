# My CLI controller

class MovieController
  
  def call
    # Scrape.new.scrape_theaters
    puts "Welcome to Movie Finder!"
    puts "The CLI that searches for movies playing in your area."
    puts "Enter your zip code to list theaters: "
    # make sure user entered a valid number, continue to get input
    zip_code = gets.strip
    list_theaters(zip_code)
    list_movies
  end
  
  def list_theaters(zip_code)
    Scrape.new(zip_code)
    puts "Theater Name -- Location -- Theater Phone Number"
    Theater.all.each.with_index(1) do |theater, i|
      puts "#{i}. #{theater.name} -- #{theater.location} -- #{theater.phone_number}"
    end
  end 
  
  def list_movies
    puts "Select a movie theater to list movies currently playing."
    puts "To re-enter a zip code type 'menu'"
    puts "To exit Movie Finder type 'exit'"
    theater_selection = gets.strip.to_i
    Scrape.scrape_movies(Theater.all[theater_selection - 1].url)
    Movie.all.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name}"
      puts "Show times ---- #{movie.show_times}"
    end 
  end 
end




 # # want an array to select from
    # input = gets.strip
    # case input
    # when "1"
    #   puts "movie info on theater 1"
    # when "2"
    #   puts "movie info on theater 2"
    # when "menu"
    #   call
    # else
    #   puts "Invalid input!"
    #   movie_list
    # end 