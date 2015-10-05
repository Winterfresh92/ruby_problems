def bubble_sort_by(arr, &block)
	swaps = -1
	until swaps == 0
		swaps = 0
		for i in 0...arr.size - 1
			if yield(arr[i], arr[i + 1]) > 0
				arr[i], arr[i + 1] = arr[i + 1], arr[i]
				swaps += 1
			end
		end
	end
	puts arr
end

bubble_sort_by(["hi", "hello", "hey"]) do |left,right|
	right.length - left.length
end