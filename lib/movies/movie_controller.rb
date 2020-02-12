# My CLI controller

class MovieController
  
  def call
    list_theaters
    list_movies
  end
  
  def list_theaters
    puts "                     ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    puts "                    Welcome to Movie Finder!"
    puts "     The CLI that searches for movies playing in your area."
    puts "                To exit Movie Finder type 'exit'"
    print "            Enter your zip code to list theaters: "
    
    input = gets.strip.downcase
    if input.to_i > 0
      Scrape.scrape_theaters(input)
      puts ""
      puts ""
      Theater.all.each.with_index(1) do |theater, i|
        puts "#{i}. #{theater.name} -- #{theater.distance}"
        puts "    Location: #{theater.location}"
        puts "    Phone: #{theater.phone_number}"
        puts ""
      end
    
    elsif input == "exit"
      exit_program
    
    else
      puts "                ! ~ ! ~ ! ~ ! ~"
      puts "                 Invalid Input!"
      puts "                ! ~ ! ~ ! ~ ! ~"
      puts ""
      call
    end 
  end 
  
  def list_movies
    puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
    puts "Enter the theater number to list movies currently playing."
    puts "To re-enter a zip code type 'menu'"
    puts "To exit Movie Finder type 'exit'"
    print "Selection: "
    input = gets.strip.downcase

    
    if input.to_i > 0
      puts ""
      Scrape.scrape_movies(Theater.all[input.to_i - 1].url)
      Movie.all.each.with_index(1) do |movie, i|
        puts "#{i}. #{movie.name}"
        puts "    Show times: #{movie.show_times}"
        puts ""
      end
      list_movie_info
      
    elsif input == 'menu'
      Theater.clear
      Movie.clear
      call
    
    elsif input == 'exit'
      exit_program
    
    else
      puts "                ! ~ ! ~ ! ~ ! ~"
      puts "                 Invalid Input!"
      puts "                ! ~ ! ~ ! ~ ! ~"
      puts ""
      list_movies
    end 
  end
  
  def list_movie_info
    puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
    puts "Enter the movie number for more information."
    puts "To re-enter a zip code type 'menu'"
    puts "To exit Movie Finder type 'exit'"
    print "Selection: "
    input = gets.strip.downcase
    
    if input.to_i > 0
       movie = Movie.all[input.to_i - 1]
       Scrape.scrape_movie_info(movie.url, movie)
    end 
  end 
  
  def exit_program
    puts ""
    puts "          { Thanks for using Movie Finder! Good-Bye! }"
    puts ""
    exit(true)
  end 
end