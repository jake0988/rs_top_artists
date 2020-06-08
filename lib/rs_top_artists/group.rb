module RsTopArtists::Group

    def group_convert(number)
        case
        when number == 1
        array = (1..10).to_a
        array = array.map{|e| e.to_s}
        when number != 1
        i = number.to_i * 10
        array = (i+1..(i + 10))
        array = array.map{|e| e.to_s}
        end       
        array    
    end
end


class RsTopArtists::Extra
    include  RsTopArtists::Group
end