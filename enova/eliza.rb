
# 1. ask eliza a question or input a statement
# 2. eliza comes up with a possible answer
# 3. eliza prints her answer to you
require 'pry'

# model
# word : classification
$nouns = ['head', 'mother', 'singer']
$verbs = ['jump', 'spin', 'crawl', 'dive', 'dip']
$question_answers = ['This is a question. I really do not care about your']
$statement_answers = ['This is a statement. I really do not care about your']


# controller
# eliza get answer
class Eliza
	attr_accessor :input
	def initialize
		@input = input
		@game = true
	end

	def get_answer
		puts "My name is Eliza. Please Ask me a question"
		while @game == true
			@input = gets.chomp

			#binding.pry
			
			split_question(@input)

			eval_statement(@input)

			exit_game(@input)
		end
	end

	def exit_game(input)
		if input[0] == 'exit'
			@game = false
		end
	end

	def question_or_answer
		

	end

	def split_question(input)
		@input = input.split(' ')
	end

	def eval_statement(input)
		if input[-1][-1] == '?'
			# question
			puts 'This is a question'
			question(input)
		else
			# sentence
			puts 'This is a statement'
			statement(input)
		end

	end

	def question(input)
		input[-1] = input[-1].strip.chop
		#binding.pry
		for word in input
			if $nouns.include?(word)
				puts "#{$question_answers[0]} #{word}"
			else
				puts $question_answers
			end
		end
	end

	def statement(input)
		for word in input
			if $nouns.include?(word)
				puts "#{$statement_answers[0]} #{word}"
			else
				puts $statement_answers
			end
		end
	end

end



eliza = Eliza.new
eliza.get_answer







# function Eliza() {
# 	this.
# 	this.get_answer: function() {

# 	}
# }








