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
      show_movies
      list_movie_info
      
    elsif input == 'menu'
      Theater.clear
      Movie.clear
      call
    
    elsif input == 'exit'
      exit_program
    
    else
      puts ""
      puts "! ~ ! ~ ! ~ ! ~ Invalid Input ~ ! ~ ! ~ ! ~ !"
      puts ""
      list_movies
    end 
  end
  
  def list_movie_info
    puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
    puts "Enter the movie number for more information."
    puts "To go back to theater list type 'theaters'"
    puts "To re-enter a zip code type 'menu'"
    puts "To exit Movie Finder type 'exit'"
    print "Selection: "
    input = gets.strip.downcase
    
    if input.to_i > 0
       show_movie_info(input)
       list_movie_info
       
    elsif input == 'menu'
      Theater.clear
      Movie.clear
      call
      
    elsif input == 'theaters'
      show_theaters
      list_movie_info

    elsif input == 'exit'
      exit_program
  
    else
      puts ""
      puts "! ~ ! ~ ! ~ ! ~ Invalid Input ~ ! ~ ! ~ ! ~ !"
      puts ""
      list_movie_info
    end 
  end
  
  def show_theaters
   Theater.all.each.with_index(1) do |theater, i|
      puts "#{i}. #{theater.name} -- #{theater.distance}"
      puts "    Location: #{theater.location}"
      puts "    Phone: #{theater.phone_number}"
      puts ""
    end
  end
  
  def show_movies
    Movie.all.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name}"
      puts "    Show times: #{movie.show_times}"
      puts ""
    end
  end
  
  def show_movie_info(input)
    movie = Movie.all[input.to_i - 1]
       Scrape.scrape_movie_info(movie.url, movie)
       puts ""
       puts "~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~"
       puts "Movie Info: #{movie.name}"
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
     end 
  
  def exit_program
    puts ""
    puts "          { Thanks for using Movie Finder! Good-Bye! }"
    puts ""
    exit(true)
  end 
end