class MovieController
  
  def call
    theaters
    movies
  end
  
  # User is shown a list of nearby theaters after entering a zipcode
  def theaters
    puts "                     ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    puts "                    Welcome to Movie Finder!"
    puts "     The CLI that searches for movies playing in your area."
    puts "                To exit Movie Finder type 'exit'"
    print "            Enter your zip code to list theaters: "
    
    input = gets.strip.downcase
    if input.to_i > 0
      Scrape.scrape_theaters(input)
      show_theaters
    
    elsif input == "exit"
      exit_program
    
    else
      puts ""
      puts "          ! ~ ! ~ ! ~ ! ~ Invalid Input ~ ! ~ ! ~ ! ~ !"
      puts ""
      call
    end 
  end 
  
  # User is shown a list of movies playing at a chosen theater
  def movies
    puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
    puts "Enter the theater number to list movies currently playing."
    puts "To re-enter a zip code type 'menu'"
    puts "To exit Movie Finder type 'exit'"
    print "Selection: "
    
    input = gets.strip.downcase
    case input
    
    when -> (input) {input.to_i > 0}
      Scrape.scrape_movies(Theater.all[input.to_i - 1].url)
      show_movies
      show_movie_info
    
    when 'menu'
      Theater.clear
      Movie.clear
      call
    
    when 'exit'
      exit_program
    
    else
      puts ""
      puts "! ~ ! ~ ! ~ ! ~ Invalid Input ~ ! ~ ! ~ ! ~ !"
      puts ""
      movies
    end 
  end
  
  # User is show additional information about a chosen movie
  def show_movie_info
    puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
    puts "Enter the movie number for more information."
    puts ""
    puts "To go back to theater list type 'theaters'"
    puts "To go back to movie list type 'movies"
    puts "To re-enter a zip code type 'menu'"
    puts "To exit Movie Finder type 'exit'"
    print "Selection: "
    
    input = gets.strip.downcase
    case input
    
    when -> (input) {input.to_i > 0}
      movie = Movie.all[input.to_i - 1]
      Scrape.scrape_movie_info(movie.url, movie)
      puts ""
      puts "Movie Info: #{movie.name}"
      puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
      puts ""
      puts "#{movie.release_date}"
      puts ""
      puts "#{movie.cast}"
      puts ""
      puts "Summary: #{movie.summary}"
      puts ""
      puts "#{movie.producers}"
      puts ""
      puts "#{movie.distributors}"
      puts ""
      show_movie_info
       
    when 'menu'
      Theater.clear
      Movie.clear
      call
      
    when 'theaters'
      Movie.clear
      show_theaters
      movies
      
    when 'movies'
      show_movies
      show_movie_info

    when 'exit'
      exit_program
  
    else
      puts ""
      puts "! ~ ! ~ ! ~ ! ~ Invalid Input ~ ! ~ ! ~ ! ~ !"
      puts ""
      show_movie_info
    end 
  end
  
  # Iterates through all Theater class instances and displays theater information
  def show_theaters
   puts ""
   puts "Listed below are your nearby theaters"
   puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
   puts ""
   Theater.all.each.with_index(1) do |theater, i|
      puts "#{i}. #{theater.name} -- #{theater.distance}"
      puts "    Address: #{theater.location}"
      puts "    Phone: #{theater.phone_number}"
      puts ""
    end
  end
  
  # Iterates through all Movie class instances and displays movie show times
  def show_movies
    puts ""
    puts "Here are the movies playing at your selected theater"
    puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
    puts ""
    Movie.all.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name}"
      puts "    Show Times: #{movie.show_times}"
      puts ""
    end
  end

  # Allows user to stop the CLI program
  def exit_program
    puts ""
    puts "          { Thanks for using Movie Finder! Good-Bye! }"
    puts ""
    exit(true)
  end 
end