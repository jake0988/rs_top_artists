class RsTopArtists::Extra
    
    @@all = []

    def initialize 
        call
    end

    
    def call
        @list = RsTopArtists::Artist.all
        @list = @list.reverse
        welcome
        list_artists
        create_group_artists
        list_group_artists
        RsTopArtists::CLI.new.goodbye

    end

    def welcome 
        puts "\n\n\n\n\n"
        puts "Welcome to the extra choose an artist by group class"
        sleep(4)
    end

    def self.all
        @@all
    end

    def self.list
        @list
    end

    def list_artists  
        print "You have previously selected "
         @@all.each do |artist|
            if artist == @@all.last
                print "and #{artist.name}!"
                puts "Great choices! But but did you know in the extra class you can also find artists by groups?"
                puts "Select a group of artist names by entering '1' for the top ten, '2' for 10 - 20, etc. "
                selection = 0
                while selection < 1 || selection > 10
                    puts "Please enter 1 - 9"
                    selection = gets.strip.to_i
                end
                case
                when selection == 1
                    puts "You have chosen the TOP 10!"
                when selection != 1
                    puts "You have chosen #{selection}-#{selection+9}"
                end
                return extra(selection)
             end
         puts "#{artist.name}, "
        end
    end

    def extra(selection)
        @numbers = group_convert(selection)
    end

    def create_group_artists
        @artists = []
        @numbers.each do |number|   
            name = @list[number.to_i-1].name
            info = @list[number.to_i-1].info.strip.gsub(/\s+/, " ")
            @artists << RsTopArtists::Artist.new(name, info)
        end
        @artists = @artists.reverse
    end
    
    def list_group_artists
        puts "The following is the list of artists you requested"
        @artists.zip(@numbers.reverse) do |artist, index|
        name = artist.name.strip
        puts "#{index}. #{name}"
        sleep(1)
        end
    end
end