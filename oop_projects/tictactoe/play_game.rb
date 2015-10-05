class Game
	require_relative 'board'
	def initialize
		@board = Board.new
		@over = []
		play_game
	end

	def play_game
		game_loop
	end

	private

	def o_turn
		puts "O, enter coordinates as \"0-2,0-2\""
		coords = gets.chomp.split(',')
		@board.moves[coords[0].to_i * 3 + coords[1].to_i] = 'O'
		@board.draw_board
	end

	def x_turn
		puts "X, enter coordinates as \"0-2,0-2\""
		coords = gets.chomp.split(',')
		@board.moves[coords[0].to_i * 3 + coords[1].to_i] = 'X'
		@board.draw_board
	end

	def game_loop
		loop do
			o_turn
			if check_for_winner('O')
				puts "O won!"
				break
			end
			x_turn
			if check_for_winner('X')
				puts "X won!"
				break
			end
		end
	end

	def check_for_winner(player)
		if @board.moves[0] == player && @board.moves[1] == player && @board.moves[2] == player
			over = true
		end
		if @board.moves[3] == player && @board.moves[4] == player && @board.moves[5] == player
			over = true
		end
		if @board.moves[6] == player && @board.moves[7] == player && @board.moves[8] == player
			over = true
		end
		if @board.moves[0] == player && @board.moves[3] == player && @board.moves[6] == player
			over = true
		end
		if @board.moves[1] == player && @board.moves[4] == player && @board.moves[7] == player
			over = true
		end
		if @board.moves[2] == player && @board.moves[5] == player && @board.moves[8] == player
			over = true
		end
		if @board.moves[0] == player && @board.moves[4] == player && @board.moves[8] == player
			over = true
		end
		if @board.moves[2] == player && @board.moves[4] == player && @board.moves[6] == player
			over = true
		end
		over
	end
end

g = Game.new