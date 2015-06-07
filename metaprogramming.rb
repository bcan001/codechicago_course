# Metaprogramming is the act of writing code that operates on code rather than on data. This involves inspecting and modifying a program as it runs using constructs exposed by the language.
require_relative 'metaprogramming2'

class Animal
	include SuperPowers
	def self.inherited(subclass)
		puts "a new subclass of #{subclass} was created"
	end
end

class Dog < Animal
end

class Cat < Animal
end


# every time a new subclass is created, print the statement
dog = Dog.new
cat = Cat.new




# ====================================
# at_exit method

at_exit do
	puts "goodbye"
end




