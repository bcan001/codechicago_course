# require_relative takes in a file from the SAME folder

require_relative 'roman_numerals'


# how to call and use rspec in terminal
#rspec filename


is_anagram?('cinema','iceman') ==  true
# written in rpsec:
expect(is_anagram?('cinema','iceman')).to be(true)



# rspec syntax
describe - the area you are testing (ex. name of method you are testing, or page you are on)
context - when the event is happening, what is going on?
it - what are you expecting "it" to do
let - assigns variable for testing only

