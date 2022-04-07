require 'byebug'

class Player
    def get_move
        p "enter a position with coordinates seperated with a space like '4 7'"
        coord = gets.chomp.split(' ')
        arr = [coord[0].to_i, coord[1].to_i]
        arr
    end
end
