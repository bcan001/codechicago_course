

def is_anagram?(w1,w2)

	w1=w1.downcase.split(//)
	w2=w2.downcase.split(//)

	w1.sort!
	w2.sort!

	if w1 == w2
		return true
	else
		return false
	end
end

def anagrams_for(word,dictionary)
	#dictionary = ['acres', 'cares', 'Cesar', 'races', 'smelt', 'melts', 'etlsm', 'shazam']
	#word = 'smelt'
	# word.downcase!
	# dictionary.each do |w|
	# 	w.downcase!
	# end

	#p word
	#p dictionary

	dictionary.delete_if do |i|

		#p is_anagram?(word,i)

		is_anagram?(word,i) == false
	end
end

# all anagrams

def fact(n)
  if n<= 1
    1
  else
    n * fact( n - 1 )
  end
end

def all_anagrams(word)
	# create a new array of the word
	word = word.downcase.split(//)
	# count the size of the array
	size = word.length
	# factorial the length of the word
	factorial_num = fact(size)
	p factorial_num
	
	# word.shuffle
	# 
end

# DRIVER TESTS GO BELOW THIS LINE (DO NOT EDIT THIS CODE!)
puts "Running tests for `is_anagram?`..."
puts is_anagram?('cinema', 'iceman') == true # The order of the arguments should not matter.
puts is_anagram?('iceman', 'cinema') == true 
puts is_anagram?('pants', 'pants')   == true # A word is an anagram of itself.
puts is_anagram?('CiNemA', 'iceman') == true # Anagrams are case-insensitive
puts is_anagram?('abcde2', 'c2abed')  == true # The String arguments don’t need to be valid English words.
puts is_anagram?('kilso', 'osilk')   == true
puts is_anagram?('Angel', 'gle an') == false # Anagrams should not be detected with extra spaces.
puts 
puts "Running tests for `anagrams_for`..."
dictionary = ['acres', 'cares', 'Cesar', 'races', 'smelt', 'melts', 'etlsm', 'shazam']
puts anagrams_for('smelt', dictionary) == ['smelt', 'melts', 'etlsm'] # detects anagrams in dictionary
puts anagrams_for('sMelt', dictionary) == ['smelt', 'melts', 'etlsm'] # Detecting anagrams should be case insensitive
puts anagrams_for('smelt', dictionary).count('smelt') == 1 # includes the input word in result if it's in the dictionary
puts anagrams_for('smetl', dictionary) == ['smelt', 'melts', 'etlsm'] # finds anagrams even if input word not in dictionary
puts anagrams_for('sm', dictionary) == []  # If there are no anagrams, an empty array should be returned
puts


puts
puts
all_anagrams("beautiful")



puts "Finished running tests."