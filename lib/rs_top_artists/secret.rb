class RsTopArtists::Secret
    @@all = []
    def initialize 
        call
        @@list << RsTopArtists::Artist.all
    end

    
    def call
        welcome
        list_artists
        secret
        RsTopArtists::CLI.new.goodbye
    end

    def welcome
        puts "
        ,,,,,,,??TWWWWWT?,,,,,,,,,,,,,
        ?TWHHHHHHHHHHHHHHT,,,,,,,,
        ?HHHHHHHHHHHHHHHHHHH?,,,
        ,,,WHW?,,,,,,,,,??WHHHHHHT,,
        ,,,,,,,,,,,,,,,,,,,,,,,,,,HHHHHHW
        ,,,,,,,,,,,,,,,,,,,,,,,,,,,?HHHHHH
        ,,,,,,,,,,,,,,,,,,,,,,,,,,,?HHHHHH
        ,,,,,,,,,,,,,,,,,,,,,,,,,,?WHHHHW
        ,,,,,,,,,,,,,,,,,,,,,,,,?WHHHHH??
        ,,,,,,,,,,,,,,,,,,,,,,THHHHHHT?,,
        ,,,,,,,,,,,,,,,,,,,THHHHHHW,,,,,
        ,,,,,,,,,,,,,,,,,WHHHHHW,,,,,,,,
        ,,,,,,,,,,,,,,WHHHHHT?,,,,,,,,,,,
        ,,,,,,,,,,,,HHHHHHT,,,,,,,,,,,,,,,
        ,,,,,,,,,,THHHHHT?,,,,,,,,,,,,,,,,
        ,,,,,,,,,,WHHHW?,,,,,,,,,,,,,,,,,
        ,,,,,,,,,THHHHH,,,,,,,,,,,,,,,,,,,,
        ,,,,,,,,,,WHHHH,,,,,,,,,,,,,,,,,,,
        ,,,,,,,,,,WHHHH,,,,,,,,,,,,,,,,,,,
        ,,,,,,,,,,,,??????,,,,,,,,,,,,,,,,,,,
        ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
        ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
        ,,,,,,,,,,?THHHHHT,,,,,,,,,,,,,,,,
        ,,,,,,,,THHHHHHHHW,,,,,,,,,,,,,
        ,,,,,,,,WHHHHHHHHH,,,,,,,,,,,,,
        ,,,,,,,,WHHHHHHHHH,,,,,,,,,,,,,
        ,,,,,,,,,,TWHHHHW?,,,,,,,,,,,,,,
   "
        puts "\n\n\nWhat the\n\n\n\n"
        puts "WELCOME TO THE SECRET CLASS WHERE EVERYTHING IS CRAZY!"
        sleep(10)
        puts "THIS\n"
        sleep(3)
        puts "                     \ / _
                                ___,,,
                                \_[o o]
Errare humanum est!              C\  _\/
/                     _____),_/__
________                  /     \/   /
_|       .|                /      o   /
| |       .|               /          /
\|       .|              /          /
|________|             /_        \/
__|___|__             _//\        \
_____|_________|____       \  \ \        \
_|       ///  \        \
|               \       /
|               /      /
|              /      /
________________  |             /__    /_
b'ger        ...|_|.............. /______\.......\n"


        sleep(2)
        puts "IS\n"
        sleep(2)
        puts "AMAZING!!!!!!!!!!!!!"
    end

    def self.all
        @@all
    end

    def self.list
        @@list
    end

    def list_artists
        puts "You have previously selected "
        @@all.each do |artist|
            if artist == @@all.last
                puts "and #{artist.name}! Great choices! But what you didn't know is that "
                return
            end
         puts "#{artist.name}, "
         binding.pry
        end
    end

    def secret
        @list = RsTopArtists::Artist.all
        rando = @list.sample
        puts "But you were probably unawared that #{rando.name} is/are also on the list, and has/have the same letters as "
        rando = rando.name.split("")
        rando.shuffle!
        rando = rando.join
        puts rando
        sleep(10)
    end
end