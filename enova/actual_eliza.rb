# Processing consists of the following steps.
# First the sentence broken down into words, separated by spaces.  All further
# processing takes place on these words as a whole, not on the individual
# characters in them.
# Second, a set of pre-substitutions takes place.
# Third, Eliza takes all the words in the sentence and makes a list of all
# keywords it finds.  It sorts this keyword list in descending weight.  It
# process these keywords until it produces an output.

# Fourth, for the given keyword, a list of decomposition patterns is searched.
# The first one that matches is selected.  If no match is found, the next keyword
# is selected instead.
# Fifth, for the matching decomposition pattern, a reassembly pattern is
# selected.  There may be several reassembly patterns, but only one is used
# for a given sentence.  If a subsequent sentence selects the same decomposition
# pattern, the next reassembly pattern in sequence is used, until they have all
# been used, at which point Eliza starts over with the first reassembly pattern.
# Sixth, a set of post-substitutions takes place.
# Finally, the resulting sentence is displayed as output.


# 1. convert to an array, each word is contained
# 2. do the following on each word
# 	- pre-substitutions takes place on each word
# 3. finds all keywords in the sentence
# 	- sorts keyword list in descending weight
# 		- search decompostition patterns for each keyword, the first one that matches is selected
# 			- for the matching decomposition pattern, a reassembly pattern is selected. (one is used for a given sentence. if there are more sentences, then the next reassembly pattern is used until all reassembly patterns are used. loops through these reassembly patterns if all of them are used)
# 					- a set of post-substitutions takes place



# 					- print the sentence that results
require 'pry'
require_relative 'actual_eliza_model'


class Eliza
	attr_accessor :data, :keywords
	def initialize
		script = 'script.txt'
		file = File.open(script, 'r')

		@text_lines = ['initial:','quit:','pre:','post:','synon:','final:']
		@sub_lines = ['decomp:','reasmb:']

		# data structures with all the values for eliza to use when evaluating an inputted sentence
		@data = Database.new([],[],[],[],[])

		@keywords = []

		parse_data(file)

		@keep_asking = true

		#@input = 'dreamed dream perhaps cant wont'

	end

	def start
		# eliza welcomes you
		hello

		while @keep_asking == true
			# take input of a sentence from the user
			@input = gets.chomp

			# convert sentence into an array
			@input = @input.split(' ')

			p @input

			# check to see if the user has inputted 'exit' to stop asking eliza questions
			exit_check

			# use these methods in run methods
			pre_substitution

			find_keywords
			sort_keywords
			search_decomposition_patterns
			post_substitutions

		end

		# eliza says goodbye
		goodbye

	end

	def hello
		#binding.pry
		@data.eliza_statements.each do |statement|
			if statement.classification == 'initial:'
				puts "#{statement.value[:text].join(' ')}"
			end
		end
	end

	def goodbye
		@data.eliza_statements.each do |statement|
			if statement.classification == 'final:'
				puts "#{statement.value[:text].join(' ')}"
			end
		end
	end

	def exit_check
		if @input[0] == 'exit'
			@keep_asking = false
		end
	end

	def parse_data(file)
		file.each.with_index(1) do |line, index|		
			
			if @sub_lines.include?(line.split(' ')[0]) == false
				@new_line = Line.new
				@new_line.classification = line.split(' ')[0]

				if @text_lines.include?(@new_line.classification) 
					@new_line.value = {text: line.split(' ')[1..-1]}
				elsif @new_line.classification == 'key:'
					@new_line.value = {text: line.split(' ')[1], weight: line.split(' ')[2].to_i}
				end
			end

			if @sub_lines.include?(line.split(' ')[0]) == true
				if (line.split(' ')[0]) == 'decomp:'
					@new_line.value[:key] = {decomp: [],reasmb: []}
					@new_line.value[:key][:decomp] << line.split(' ')[1..-1]
				elsif (line.split(' ')[0]) == 'reasmb:'
					@new_line.value[:key][:reasmb] << line.split(' ')[1..-1]
				end
			end

			if @new_line.classification == 'key:'
				@data.decomp << @new_line
			elsif @new_line.classification == 'pre:'
				@data.pre << @new_line
			elsif @new_line.classification == 'post:'
				@data.post << @new_line
			elsif @new_line.classification == 'synon:'
				@data.synon << @new_line
			else
				@data.eliza_statements << @new_line
			end

		end
		p @data.decomp[0]
	end


	def pre_substitution
		@input.each.with_index(0) do |word, index|
			@data.pre.each do |pre|
				if pre.value[:text][0] == word
					@input[index] = pre.value[:text][1..-1][0]
				end
			end
		end
		p @input
		p 'presub complete!'
		puts
	end

	def find_keywords
		@input.each.with_index(0) do |word, index|
			@data.decomp.each do |key|
				# if key.value[]
				# 1. look through each word in @input and see if they match any of the keywords. makes a list of these keywords
				#p key.value[:text] # each key word in decomps

				# some keywords from the script: dreamed dream perhaps
				if word == key.value[:text]
					@keywords << [word,key.value[:weight]] unless @keywords.include?([word,key.value[:weight]])
					#p key
				end

			end
		end

		p @keywords
		p 'keywords found'
		puts
	end

	def sort_keywords
		# 2. sort the list of keywords based on weight in descending order (10,9,8..1)
		@keywords = @keywords.sort_by { |k| k[1] }
		@keywords = @keywords.reverse
	
		p @keywords
		p 'keywords sorted'
		puts
	end

	def search_decomposition_patterns
		# 3. for the highest weighted keyword, a list of decomposition patterns is searched. if no decomp match is found, it cycles to the next keyword until a decomp pattern can be used.
		# need to search words AFTER the keyword to find the decomposition pattern.

		#@input.each.with_index(0) do |word, index|
			# @input = ["i", "remember", "that", "girl"]
			@keywords.each do |keyword|
				# @keywords = [["remember", 5], ["i", 0]]
				@data.decomp.each do |decomp|
					# @decomp = [#<Line:0x007fa05cb8a638 @classification="key:", @value={:text=>"like", :weight=>10, :key=>{:decomp=>[["*", "@be", "*like", "*"]], :reasmb=>[["goto", "alike"]]}}>, ...] 

					# p decomp.value[:key][:decomp][0][1..-2]

					#p decomp.value[:key][:decomp][0].join(' ')

					p decomp.value[:key][:decomp][0].join(' ')



					# check if a decomp pattern is contained inside the input
					# if decomp.value[:key][:decomp][0][1..-2].all? { |i| @input.include? i } #is contained in @input

					# 	p 'the decomp matches'
					# end

					if @input.join(' ') =~ /^[decomp.value[:key][:decomp][0].join(' ')]+$/

						p 'match'
					end

					# .sub() replaces only the first instance
					# .gsub() replaces all instances

					# "The man in the park".gsub(/the/, 'a') ===> a man in the park

				end
			end
		#end

		p @input
		p 'decomp patterns search complete'
		puts
	end


	# 4. select a reassembly pattern. (one for each sentence)



	def post_substitutions
		# 5. post substitutions takes place

		@input.each.with_index(0) do |word, index|
			@data.post.each do |post|
				if post.value[:text][0] == word
					@input[index] = post.value[:text][1..-1][0]
				end
			end
		end
		p @input
		p 'post sub complete!'
		puts
	end


end


eliza = Eliza.new
eliza.start







