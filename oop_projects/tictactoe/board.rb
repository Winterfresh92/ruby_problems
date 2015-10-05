class Board
	attr_accessor :moves

	def initialize
		@moves = [' ', ' ', ' ',
				 ' ', ' ', ' ',
				 ' ', ' ', ' ']
	end

	def draw_board
		for i in 0..8
			if i % 3 == 0
				print "|" unless i == 0
				print "\n-------\n"
			end
			print '|' + @moves[i]
		end
		print "|\n-------\n"
	end
end

b = Board.new

b.draw_board