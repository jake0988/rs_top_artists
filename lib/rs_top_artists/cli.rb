class RsTopArtists::CLI
    @@extra_list = []

    def call
        @count = 0
        # RsTopArtists::Scraper.scrape_artists
        welcome       
        # @input = ""
        # until @input == "exit" 
        get_artists
        get_user_input
        list_artists
        select_artist
        extra_method_collect
        another_artist
        goodbye
        # end
    end

    def second_plus_call
        @count += 1
        if @count == 2
            @count += 1
            extra_method
        end
        list_artists
        select_artist
        extra_method_collect
        another_artist
        goodbye
    end

    def welcome
        puts "\n\nWelcome to Rolling Stone's top 100 artist list."
    end

    def get_artists
        @artists = RsTopArtists::Artist.all
    end

    def get_user_input
        puts "\nType 'y' if you would like to see this list. Type 'n' if you'd like to exit."
        bool = gets.strip
            if bool == "y"
                return
            elsif bool == "n"
                puts "That's reasonable\n"
                puts "Are you sure?"
                bool = gets.strip
                if bool == "y"
                    return goodbye_two
                elsif bool == "n"
                    return
                else
                    puts "\nnot an accepted input, try again."
                    return get_user_input
                end
            else
                puts "\nnot an accepted input, try again."
                return get_user_input
            end        
    end

    def list_artists
            count = 101
            @artists.each do |artist|
            puts "#{count -= 1}. #{artist.name}"
            end 
            puts "\nWhat artist would you like more information on? (Select a number)"
                @input = gets.strip
                @input = @input.to_i
            while @input < 1 || @input > @artists.length
                puts "\nPlease type a valid entry. \n"
                puts "\nWhat artist would you like more information on? (Select a number)"
                @input = gets.strip.to_i
            end
    end

    def select_artist
             art_rev = @artists.reverse
             @artist = art_rev[@input - 1]
              puts "\nYou have selected: #{@artist.name}\nIs this correct? (y/n)"
            bool = gets.strip     
         if bool == "y"
                puts "\n"
                puts @artist.info 
         return    
        else
                second_plus_call    
        end        
    end

    def extra_method_collect
        RsTopArtists::Extra.all << @artist    
    end

    def extra_method
        RsTopArtists::Extra.new
    end        

    def another_artist
        puts "\nInteresting stuff! Would you like to view another artist? (y/n)"
        bool = gets.strip
        if bool == "y"
            return second_plus_call
        elsif bool == "n"
            return goodbye
        else
            puts "\nnot an accepted input, please try again."
            return another_artist
        end
    end

    def goodbye
        puts "¶¶¶¶_________________________¶¶
        __¶¶¶¶¶_______________________¶¶
        __¶¶__¶¶_____________________¶¶¶¶
        ___¶¶__¶¶____________________¶¶¶¶¶
        ____¶¶_¶¶¶___________________¶¶__¶¶
        ____¶¶_¶¶¶___________________¶¶__¶¶
        _____¶¶¶¶¶___________________¶¶_¶¶¶
        _____¶¶¶¶______________¶¶¶¶ ¶¶__¶¶
        ____¶¶¶¶_____________¶¶¶¶¶¶¶¶¶_¶¶
        ___¶¶¶_¶¶__¶¶¶_______¶¶¶¶¶¶¶¶
        __¶¶¶___¶¶¶¶¶¶¶¶¶_____¶¶¶¶¶¶
        _¶¶¶¶__¶¶¶¶___¶¶¶¶_______________________¶¶
        _¶¶¶__¶¶¶¶_¶¶¶__¶¶¶__________________¶¶¶¶¶¶
        ¶¶¶¶__¶¶¶¶¶¶¶¶¶__¶¶¶______________¶¶¶¶¶¶¶¶¶
        _¶¶¶__¶¶¶_¶¶__¶__¶¶¶___________¶¶¶¶¶¶¶___¶¶
        _¶¶¶¶__¶¶¶¶¶¶¶¶__¶¶________¶¶¶¶¶¶¶¶______¶¶
        __¶¶¶¶____¶¶¶__¶¶¶______¶¶¶¶¶¶¶¶¶¶_______¶¶
        ___¶¶¶¶¶¶___¶¶¶¶¶______¶¶¶¶¶¶¶___¶¶_______¶¶
        _____¶¶¶¶¶¶¶¶¶¶________¶¶¶¶¶_____¶¶___¶¶¶¶¶¶
        ________¶¶¶_¶¶¶________¶¶________¶¶__¶¶¶¶¶¶¶
        _______¶¶¶¶¶_¶¶________¶¶_____¶¶¶¶___¶¶¶¶¶
        _______¶¶¶___¶¶_________¶¶___¶¶¶¶¶¶
        _________¶¶¶¶¶__________¶¶___¶¶¶¶¶¶
        _________________________¶¶__¶¶¶¶
        _____________________¶¶¶¶¶¶
        ____________________¶¶¶¶¶¶¶
        ____________________¶¶¶¶¶¶
        "
        puts "\nGoodbye, enjoy your knowledge.\n"
        exit
    end

    def goodbye_two
        puts "\nOh well, maybe next time.\n"
        exit
    end
end