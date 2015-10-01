$depth = 0

def log blockDescription, &block
	puts "Beginning \"#{blockDescription}\"...".prepend("  " * $depth)
	value = block.call
	puts "...\"#{blockDescription}\" finished, returning: #{value}".prepend("  " * $depth)
end

log 'String Return (OUTER)' do
	$depth += 1
	log 'Number Return (INNER)' do
		$depth += 1
		log 'Number Return 2 (MORE INNER)' do
			4 + 3
		end
		$depth -= 1
		4 % 3
	end
	$depth -= 1
	$depth += 1
	log 'Array Return (INNER)' do
		[3, 2, 10, 5, 25, 17].sort!
	end
	$depth -= 1
	'this is a simple string return'
end