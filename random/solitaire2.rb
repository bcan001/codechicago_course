# solitaire

# class card
# class deck
# class game

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
	def deal_cards
		cards.pop
	end
end

class Table
	attr_accessor :ace_buckets, :seven_buckets
	def initialize
		@ace_buckets = {1=>[],2=>[],3=>[],4=>[]}
		@seven_buckets = {1=>[],2=>[],3=>[],4=>[],5=>[],6=>[],7=>[]}
	end
	def print
		puts
		puts "These are the Ace Buckets:"
		ace_buckets.each do |bucket|
			empty = []
			bucket.each do |val|
				if val[3] == 'n'
					empty << val
				end
			end
			p empty
		end
		puts
		puts "These are the Seven Buckets:"
		seven_buckets.each_value do |bucket|
			p bucket
			empty = []
			bucket.each do |val|
				if val[3] == 'n'
					empty << val
				end
			end
			p empty
		end
		puts
	end
end

class Game
	attr_accessor :deck, :table
	def initialize
		@deck = Deck.new
		@table = Table.new
	end
	def play
		deck.shuffle

		table.seven_buckets.each_key do |key|
			key.times do
				table.seven_buckets[key] << deck.deal_cards
			end
		end
		table.seven_buckets.each do |bucket|
			bucket[-1][-1][3] = 'n'
		end

		p deck
		p table
		p table.seven_buckets[1]

		table.print

		puts "what would you like to do? (#cards to move,stack from #,stack to #,stackfromtype,stacktotype) (bucket or ace)"
		input = "1,3,6,bucket,bucket" #move 1 card from the first stack to the second stack

		input = input.split(",")
		p input

		p table.seven_buckets[1]
		p table.seven_buckets[input[0].to_i]



		# can't add to a hash key using rockets, need to add to hash values
		newbucket = table.seven_buckets[3] << table.seven_buckets[1]
		p newbucket
		
		table.print




	end
end

game = Game.new
game.play


