# how to parse an xml file that's saved in the same directory, use the data stored in it in ruby
# a xml file would contain data that is structured like this:

# <pet>
#   <name>Jeffrey</name>
#   <species>Giraffe</species>
# </pet>

require "rexml/document"

file = File.open("pets.txt")
doc = REXML::Document.new file
file.close

doc.elements.each("pets/pet/name") do |element|
  puts element
end