require 'open-uri'

kittens = open('http://placekitten.com/')
response_status = kittens.status
response_body = kittens.read[559, 441]

puts response_status
puts response_body

# -------------------------------
# require 'open-uri'

# kittens = open('http://placekitten.com/200/300')

# f = File.open('kittens.jpg', 'w')
# kittens.each do |kitten|
#   f.write(kitten)
# end

# f.close