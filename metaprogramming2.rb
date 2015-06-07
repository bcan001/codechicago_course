# using modules in metaprogramming
# when a module is included, all instance methods are now available in the included class

module SuperPowers
	def self.included(klass)
		puts "Hey, I've been included in the #{klass}."
	end

	def jump
		puts "you are jumping"
	end
end


# ====================================================================================



# include for instance methods, extend for class methods

module UsefulInstanceMethods
	def an_instance_method
		puts "an instance method module"
	end
end

module UsefulClassMethods
	def a_class_method
		puts "a class method module"
	end
end

class Host
	include UsefulInstanceMethods
	extend UsefulClassMethods
end


# now, mix these both together for more elegant code, knocking off the extra step:

module UsefulMethods
	module ClassMethods
		def a_class_method
		end
	end
	def self.included(host_class)
		host_class.extend(ClassMethods)
	end
	def an_instance_method
	end
end

class Host
	include UsefulMethods
end























