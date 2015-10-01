# Project Euler problem 1, Multiples of 3 and 5

def sum_of_multiples number
	sum = 0
	count = 0
	while count < number do
		if count % 3 == 0 || count % 5 == 0
			puts count
			sum += count
		end
		count += 1
	end
	puts sum
end

sum_of_multiples(1000)