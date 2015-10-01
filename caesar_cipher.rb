def caesar_ciper(string, offset)
	new_string = ""
	string.split("").each do |letter|
		new_letter = letter.ord + offset
		if letter.match(/^[A-Za-z]$/)
			if letter.match(/^[A-Z]$/) && new_letter.ord > 'Z'.ord
				new_letter = letter.ord - (26 - offset)
				letter = new_letter.chr
			elsif letter.match(/^[a-z]$/) && new_letter.ord > 'z'.ord
				new_letter = letter.ord - (26 - offset)
				letter = new_letter.chr
			else
				letter = new_letter.chr
			end
		end
		new_string = new_string + letter
	end
	puts new_string
end

caesar_ciper("This is the new String!!FF!", 10)