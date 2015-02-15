# json is an alternative to xml. it gets its name because it's format resembles javascript
# a json file would contian data in a structure like this:
# {
#   "pets": {
#     "name": "Jeffrey",
#     "species": "Giraffe"
#   }
# }

require 'json'

pets = File.open("pets.txt", "r")

doc = ""
pets.each do |line|
  doc << line
end
pets.close

puts JSON.parse(doc)