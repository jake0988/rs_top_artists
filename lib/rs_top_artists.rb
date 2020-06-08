require_relative "./rs_top_artists/version"
require_relative "./rs_top_artists/artist"
require_relative "./rs_top_artists/cli"
require_relative "./rs_top_artists/scraper"
require_relative "./rs_top_artists/extra"
require_relative "./rs_top_artists/group"


require 'nokogiri'
require 'open-uri'
require 'pry'


module RsTopArtists
  class Error < StandardError; end
  # Your code goes here...
end
