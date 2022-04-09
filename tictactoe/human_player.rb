
require 'byebug'
class HumanPlayer
    attr_reader :playermark
    def initialize(mark)
        @playermark = mark
    end

    def get_position
        p "enter a coordinate, with a space in between ex. '4 7'"
        cord = gets.chomp
        if cord.length != 3
            raise 'format must be num space num'
        end

        cordar = cord.split
        row = cordar[0].to_i
        col = cordar[1].to_i
      
        num = (0..9).map(&:to_s).to_a
        if !num.include?(cordar[0]) || !num.include?(cordar[1])
            raise 'no letters as coordinates'
        end

        [row, col]
    end
end