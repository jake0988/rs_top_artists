class RsTopArtists::Artist

    attr_accessor :name, :info
    @@all = []
    
    
        def initialize(name, info)
            @name = name
            @info = info
            save
           
    
        end
    
        def self.all
            RsTopArtists::Scraper.scrape_artists if @@all.empty?
            @@all
        end

       

        def save
            @@all << self
        end
    
        def self.get_artists
            RsTopArtists::Scraper.scrape_artists(self) if @artists.empty?
    
        end
    end