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
        @grid.each do |row|
            if row.all?(mark)
                return true
            end
        end
        false
    end
    
    def win_col?(mark)
        (0...@grid.length - 1).each do |i|
            col = @grid.map{ |e| e[i] }
            if col.all?(mark)
                return true
            end
        end
        false
    end

    def win_diagonal?(mark)
        f = 0
        b = @grid.length - 1
        fmarks = []
        bmarks = []

        while f < @grid.length
            fmarks << @grid[f][f]
            bmarks << @grid[f][b]
            b -= 1
            f += 1
        end

        if fmarks.all?(mark) || bmarks.all?(mark)
            return true
        else 
            return false
        end
    end

    def win?(mark)
        win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |subs|
            if subs.any?('_')
                return true
            end
        end
        false
    end
end