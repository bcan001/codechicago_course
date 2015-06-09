class Animal
  # http://stackoverflow.com/questions/2505067/class-self-idiom-in-ruby
  # Now, to answer the question: class << self opens up self's singleton class, so that methods can be redefined for the current self object (which inside a class or module body is the class or module itself). Usually, this is used to define class/module ("static") methods:
  class << self
    attr_reader :animals, :animal_classes
  end
  @animals = []
  @animal_classes = []

  def initialize
    Animal.animals << self
  end

  def self.inherited(subclass)
    Animal.animal_classes << subclass
  end
end

class Dog < Animal
end

class Cat < Animal
end

class Armadillo < Animal
end

dog = Dog.new
cat1 = Cat.new
cat2 = Cat.new

puts "Animals: #{Animal.animals.inspect}"
# => Animals: [#<Dog:0x007ffe6d0acaf8>, #<Cat:0x007ffe6d0acaa8>, #<Cat:0x007ffe6d0aca58>]
puts "Animal Classes: #{Animal.animal_classes.inspect}"
# => Animal Classes: [Dog, Cat, Armadillo]