module Enumerable
	def my_each
		i = 0
		return self.to_enum if !block_given?
		while i < self.size
			yield(self[i])
			i += 1
		end
		
	end

	def my_each_with_index
		i = 0
		return self.to_enum if !block_given?
		while i < self.size
			yield(self[i], i)
			i += 1
		end
		self
	end

	def my_select

		return self.to_enum if !block_given?
		ans = []
		
		self.my_each{ |i|
			ans << i if yield(i)
		}
		ans
	end

	def my_all?
		i = 0
		ans = true
		return false if !block_given?
		while i < self.size
			if !yield(self[i])
				ans = false
			end
			i += 1
		end
		ans
	end

	def my_any?
		
		self.my_each do |x|
			return true unless yield(x)
		end
		return false
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
			result << my_proc.call(x)
		end
		result
	end

	def my_inject(initial_value = nil)
		accum = 0
		if !initial_value
			self.my_each{ |x|
			 accum = yield(accum, x)
			}
		else
			for i in 1..self.length-1 do
				accum = yield(accum, self[i])
			end
		end
		accum
	end
end

################################################          TESTS              #######################################################
