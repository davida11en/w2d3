require 'board.rb'
require 'human_player.rb'

class Game
    def initialize(player1mark, player2mark)
        @player1 = HumanPlayer.new(player1mark)
        @player2 = HumanPlayer.new(player2mark)
        @board = Board.new
        @currentplayer = @player1   
    end

    def switch_turn
        if @currentplayer == @player1 
            @currentplayer = @player2
        elsif @currentplayer == @player2
            @currentplayer = @player1
        end 
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@currentplayer.get_position, @currentplayer.playermark)

            if @board.win?(@currentplayer.playermark)
                print 'victory ' + @currentplayer.playermark
                return
            end

            self.switch_turn
        end

        print 'draw'
    end
end