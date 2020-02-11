# My CLI controller

class MovieController
  
  def call
    list_theaters
    list_movies
  end
  
  def list_theaters
    puts "Welcome to Movie Finder!"
    puts "The CLI that searches for movies playing in your area."
    print "Enter your zip code to list theaters: "
    zip_code = gets.strip
    Scrape.new(zip_code)
    puts ""
    puts "{{ Theater Name -- Location -- Phone Number }}"
    puts ""
    Theater.all.each.with_index(1) do |theater, i|
      puts "#{i}. #{theater.name} -- #{theater.location} -- #{theater.phone_number}"
    end
  end 
  
  def list_movies
    puts ""
    puts "Enter a theater index to list movies currently playing."
    puts "To re-enter a zip code type 'menu'"
    puts "To exit Movie Finder type 'exit'"
    print "Selection: "
    
    theater_selection = gets.strip.to_i
    Scrape.scrape_movies(Theater.all[theater_selection - 1].url)
    Movie.all.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name}"
      puts "Show times ---- #{movie.show_times}"
    end 
  end 
end