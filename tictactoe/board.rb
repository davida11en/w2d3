require "byebug"

class Board

    def initialize()
        @grid = Array.new(3) { Array.new(3,'_') }
    end

    def valid?(position)
        if !@grid[position[0]][position[1]]
            p "out of bounds"
            return false
        elsif position[0] < 0 || position[1] < 0
            p "no negatives"
            return false
        elsif !empty?(position)
            p "space is filled"
            return false
        else
            return true
        end
    end

    def empty?(position)
        @grid[position[0]][position[1]] == "_"
    end

    def place_mark(position, mark)
        raise 'Error' if !self.valid?(position)
        @grid[position[0]][position[1]] = mark
    end

    def print
        puts "#" * (@grid.length * 2)
        @grid.each do |sub|
            puts sub.join("|")
        end
        puts "#" * (@grid.length * 2)
    end

    def win_row?(mark) 
        @grid.each do |rows|
            rows.each do |el|
                
            end
        end
    end
    
    def win_col?(mark)

    end

    def win_diagnol?(mark)

    end
end