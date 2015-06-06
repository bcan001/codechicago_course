# solitaire oop game

# Game class

#Player = Struct.new(:name)
# Card = Struct.new(:suit, :value)
# Deck = Struct.new(:cards)
# Table = Struct.new(:acebuckets, :sevenbuckets)


class Game
	attr_reader :player, :ace_buckets, :seven_buckets, :deck
	attr_writer :seven_buckets, :acebuckets, :deck
	def initialize(player_name)
		@player = Player.new(player_name)
		@ace_buckets = {1=>[],2=>[],3=>[],4=>[]}
		@seven_buckets = {1=>[],2=>[],3=>[],4=>[],5=>[],6=>[],7=>[]}
		@deck = Deck.new
	end

	# methods for gameplay ---------------------------------

	def start_deal
		deck.shuffle
		seven_buckets.each do |key,value|
			key.times do
				seven_buckets[key] << deck.deal_cards
			end
			value[-1][-1] = 'n'
		end
	end

	def print_table
		puts "Ace Buckets:"
		ace_buckets.each do |key,value|
			puts "Bucket #{key}: #{value}"
		end
		puts
		puts "Seven Buckets:"
		seven_buckets.each do |key,value|
			puts "Bucket #{key}: #{value}"
		end
		puts
	end

	def move_card_to_bucket(bucket_from, bucket_to, card_quant)
		# input = (2,3,1)
		#p ace_buckets[1]
		#p seven_buckets[2]
		bucket1 = seven_buckets[bucket_from]
		bucket2 = seven_buckets[bucket_to]
		if move_card_to_bucket_valid?(bucket1, bucket2, card_quant) == true
			card_quant.times do
				bucket2 << bucket1.pop
				#bucket2[-1][3] = 'n'
				show_card(bucket2[-1])
			end
			seven_buckets.each do |key,value|
				show_card(value[-1])
			end
		else
			puts "Move Invalid, please choose a valid move"
		end
	end

	def move_card_to_ace_bucket(bucket_from, bucket_to, card_quant)
		bucket1 = seven_buckets[bucket_from]
		bucket2 = ace_buckets[bucket_to]
		if move_card_to_ace_bucket_valid?(bucket1, bucket2, card_quant) == true
			card_quant.times do
				bucket2 << bucket1.pop
				show_card(bucket2[-1])
			end
		end
	end

	def move_card_to_bucket_valid?(bucket_from, bucket_to, card_quant)
		true
	end

	def move_card_to_ace_bucket_valid?(bucket_from, bucket_to, card_quant)
		# the card is valid if the first card added is an ace
		# additional cards are valid if they are added in acending order (1,2,3,4,5,6,7,8,9)
		if bucket_to == []
			true
		else
			puts "Move Invalid"
			false
		end
	end

	def show_card(card)
		# card = ["h",4,'black','y']
		card[3] = 'n'
	end

	# classes for gameplay -----------------------------------

	class Player
		def initialize(name)
			@name = name
		end
		def name
			@name
		end
	end

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
end


game = Game.new("ben")
p game.player
p game.player.name
p game.ace_buckets
p game.deck.cards
p game.start_deal

puts
game.print_table
puts
game.move_card_to_bucket(4,5,3)
game.print_table
puts
game.move_card_to_ace_bucket(1,1,1)
game.print_table
