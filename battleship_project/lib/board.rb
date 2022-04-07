require 'byebug'
class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n 
    end

    def self.print_grid(grid)
        grid.each do |subar|
            subar.each do |sym|
                puts  subar[0].to_s + ' ' + subar[1].to_s
            end
        end
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |sub|
            sub.each do |el|
                if el == :S 
                    count += 1
                end
            end
        end 
        count     
    end

    def attack(pos)
        target = self[pos]
        if target == :S
            self[pos] = :H
            p "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        quarter = (@grid.length**2) / 4
       
        while self.num_ships < quarter
            randrow = rand(0...@grid.length)
            randcol = rand(0...@grid.length)
            randpos = [randrow, randcol]
            self[randpos] = :S
        end
    end

    def hidden_ships_grid
        clone = @grid.dup
        clone.map do |subs|
            subs = subs.dup
            subs.each_with_index do |char, i|
                if subs[i] == :S 
                    subs[i] = :N 
                end
            end
            subs
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
