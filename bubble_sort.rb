def bubble_sort(arr)
	swaps = -1
	until swaps == 0
		swaps = 0
		for i in 0...arr.size - 1
			if arr[i] > arr[i + 1]
				arr[i], arr[i + 1] = arr[i + 1], arr[i]
				swaps += 1
			end
		end
	end
	puts arr
end

bubble_sort([4,3,78,2,0,2])