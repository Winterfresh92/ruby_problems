def stock_picker(prices)
	max_profit = 0
	max_profit_array = []
	prices.each_with_index do |buy, b_index|
		prices[b_index..-1].each_with_index do |sell, s_index|
			profit = sell - buy
			if profit <= 0
				next
			end
			if profit > max_profit
				max_profit = profit
				max_profit_array = [b_index, s_index + b_index]
			end
		end
	end
	puts "[#{max_profit_array[0]}, #{max_profit_array[1]}]"
	max_profit_array
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])