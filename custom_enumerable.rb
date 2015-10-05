module Enumerable
	def my_each
		return self unless block_given?
		for i in self
			yield(i)
		end
	end

	def my_each_with_index
		return self unless block_given?
		for i in 0...length
			yield(self[i], i)
		end
	end

	def my_select
		return self unless block_given?
		selected = []
		for i in self
			selected << i if yield(i)
		end
		selected
	end

	def my_all?
		if block_given?
			my_each {|i| return false unless yield(i)}
		else
			my_each {|i| return false unless i}
		end
	end

	def my_any?
		if block_given?
			my_each { |i| return true if yield(i) }
		else
			my_each { |i| return true if i }
		end
	end

	def my_none?
		if block_given?
			my_each { |i| return false if yield(i) }
		else
			my_each { |i| return false if i }
		end
	end

	def my_count
		count = 0
		for i in self
			count += 1
		end
		count
	end
end