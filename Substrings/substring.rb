dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(sentence, dictionary)
	result = Hash.new{0}
	dictionary.each do |x|
		array = sentence.split(' ')
		array.each do |y|
			if y.downcase.include?x
				result[x] += 1
			end
		end		
	end
	puts result
end

substring("Howdy partner, sit down! How's it going?", dictionary)
