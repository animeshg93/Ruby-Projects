module Enumerable
	def my_each
		return self.to_enum if !block_given?
		while i < self.size
			yield(self[i])
			i += 1
		end
		
	end

	def my_each_with_index
		return self.to_enum if !block_given?
		while i < self.size
			yield(self(i), i)
			i += 1
		end
		self
	end

	def my_select
		return self.to_enum if !block_given?
		ans = []
		
		self.my_each{
			ans << i if yield(i)
		}
		ans
	end

	def my_all?
		ans = true
		return false if !block_given?
		while i < self.size
			if !yield(self(i))
				ans = false
			end
		end
		ans
	end

	def my_any?
		result = false
		self.my_each do |x|
			result = true if yield(x) or !block_given?
		end
		result
	end

	def my_none?
		ans = true
		self.my_each do |x|
			if yield(x) or !block_given?
				ans = false
			end 
		end
		ans
	end

	def my_count(c = nil)
		count = 0
		if !c
			self.my_each do |x|
				count += 1
			end
		elsif c
			self.my_each do |x|
				count += 1 if(x == c)
			end
		else
			self.my_each do |x|
				count += 1 if(yield(x))
			end
		end
		count
	end

	def my_map
		return self.to_enum if !block_given?
		result = []
		self.my_each do |x|
			result << yield(x)
		end
		result
	end

	def my_inject

	my_each_with_index

end
