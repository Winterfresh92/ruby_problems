def grandfatherClock &block
	hour = Time.now.hour % 12 + 1

	hour.times do
		block.call
	end
end

grandfatherClock do
	puts 'DONG'
end