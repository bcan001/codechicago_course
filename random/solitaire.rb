# solitaire

class Deck
	attr_accessor :cards
	def initialize
		@cards = []
		suits = ['H','D','S','C']
		values = [1,2,3,4,5,6,7,8,9,10,11,12,13]
		colors = ['black','red']
		hidden = ['y']

		suits.each do |suit|
			values.each do |face_value|
				colors.each do |color|
					hidden.each do |hide|
						@cards << [suit, face_value, color,hide]		
					end			
			end
		end
	end
	end
	def shuffle
		cards.shuffle!
	end
	def deal_card(bucket)
		bucket << cards.pop
	end

	def unhide_card(card)
		card[3] = 'n'
	end

	def hide_card(card)
		card[3] = 'y'
	end

end


class Game
	attr_accessor :deck, :ace_buckets, :seven_buckets

	def initialize
		@deck = Deck.new
		@ace_buckets = {1=>[],2=>[],3=>[],4=>[]}
		@seven_buckets = {1=>[],2=>[],3=>[],4=>[],5=>[],6=>[],7=>[]}
	end

	def play
		puts 'you are now playing the game'
		deck.shuffle
		puts

		seven_buckets.each_key do |key|
			key.times do
				deck.deal_card(seven_buckets[key])
			end
			deck.unhide_card(seven_buckets[key][-1])

		end

		p ace_buckets
		p seven_buckets


		# start the game below

		puts
		ace_buckets.each_value do |bucket|
		 	arr = []
			bucket.each do |value|
				if value[3] == 'n'
					arr << value
				end
			end
			p arr
		end
		puts
		seven_buckets.each_value do |bucket|
			arr = []
			bucket.each do |value|
				if value[3] == 'n'
					arr << value
				end
			end
			p arr
		end
		puts

		puts "what would you like to do? (#cards to move,stack from #,stack to #,stackfromtype,stacktotype) (bucket or ace)"
		input = "1,2,6,bucket,bucket" #move 1 card from the first stack to the second stack

		input = input.split(",")

		if input[3] == 'bucket' && input[4] == 'bucket'
			orig_stack2 = seven_buckets[input[2].to_i]

			stack1 = seven_buckets[input[1].to_i]
			stack2 = seven_buckets[input[2].to_i]
			card_quant = input[0].to_i
			stack2 << stack1.pop(card_quant)
			deck.unhide_card(stack1[-1])

			stack2.each do |card|
				if orig_stack2.include?(card) == false
					card[3] = 'n'
				end
			end

		elsif input[3] == 'bucket' && input[4] == 'ace'
			stack1 = seven_buckets[input[1].to_i]
			stack2 = ace_buckets[input[2].to_i]
			card_quant = input[0].to_i
			stack2 << stack1.pop(card_quant)
		end

		p stack1
		p stack2










	end	
end


game = Game.new
game.play

