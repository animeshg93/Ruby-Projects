
def cipher(string, integer)
	array = string.split('')

	array.each_index do |x|
		if (array[x].ord > 64 and array[x].ord < 91) 
			array[x] = (array[x].ord + integer).chr
			if (array[x].ord > 90)
				array[x] = (64 + array[x].ord - 90).chr
			end
		elsif (array[x].ord > 96 and array[x].ord < 123)
			array[x] = (array[x].ord + integer).chr
			if (array[x].ord > 123)
				array[x] = (95 + array[x].ord - 123).chr
			end
		end
	end
	puts array.join()
end


