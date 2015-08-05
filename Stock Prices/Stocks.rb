def stock_picker(stocks)
	max, min = stocks[0], stocks[0]
	min_index, max_index = 0, 0

	stocks[1..-1].each_index do |x|
		if(stocks[x] < min and max_index - x > 0)
			min = stocks[x]
			min_index = x
		end
		if(stocks[x] > max)
			max = stocks[x]	
			max_index = x
		end		

		if(min_index > max_index)
			max = 0
		end
	end

	puts min_index, max_index
end

stock_picker([17,3,6,9,15,8,6,1,10])