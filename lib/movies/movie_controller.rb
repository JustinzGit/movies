# My CLI controller

class MovieController
  
  def call
    list_theaters
    list_movies
  end
  
  def list_theaters
    puts ""
    puts "Welcome to Movie Finder!"
    puts "The CLI that searches for movies playing in your area."
    print "Enter your zip code to list theaters: "
    zip_code = gets.strip
    Scrape.scrape_theaters(zip_code)
    puts ""
    puts ""
    Theater.all.each.with_index(1) do |theater, i|
      puts "#{i}. #{theater.name} -- #{theater.distance}"
      puts "    Location: #{theater.location}"
      puts "    Phone: #{theater.phone_number}"
      puts ""
    end
  end 
  
  def list_movies
    puts ""
    puts "Enter a theater index to list movies currently playing."
    puts "To re-enter a zip code type 'menu'"
    puts "To exit Movie Finder type 'exit'"
    print "Selection: "
    input = gets.strip.downcase
    puts ""
    
    if input.to_i > 0
      Scrape.scrape_movies(Theater.all[input.to_i - 1].url)
      Movie.all.each.with_index(1) do |movie, i|
        puts "#{i}. #{movie.name}"
        puts "    Show times: #{movie.show_times}"
        puts ""
      end
      list_movies
      
    elsif input == 'menu'
      Theater.clear
      Movie.clear
      list_theaters
      
    elsif input == 'exit'
      exit_program
      
    else
      puts "Invalid Input!"
      list_movies
    end 
  end
  
  def exit_program
    puts "Thanks for using Movie Finder! Good-Bye!"
  end 
end