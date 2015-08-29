def bubble(array)
	length = array.length()
	swapped = false
	

	while !swapped do
		count = 0
		for x in 0..length - 2
			if array[x] > array[x+1]
				array[x], array[x+1] = array[x+1], array[x]
				count += 1
			end
		end
		if count == 0
			swapped = true
		end
	end	
end



a = [4,3,78,2,0,2]
bubble(a)

puts a
