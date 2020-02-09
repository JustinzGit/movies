# Environment file, will require all the classes we build inside movies
require "nokogiri"
require "open-uri"
require "pry"

require_relative "./movies/scrape"
require_relative "./movies/version"
require_relative "./movies/movie_controller"
require_relative "./movies/theater"


# Defining namespace, but not needed, version file takes care of this
# Whats purpose of this namespace?
# module Movies
#   class Error < StandardError; end
#   # Your code goes here...
# end
