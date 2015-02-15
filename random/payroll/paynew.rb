require 'json'

#dates = File.open("public_holidays.json", "r")

# dates.each do |date|
# 	p date
# end

file = open("./public_holidays.json")
data = file.read

data_hash = JSON.parse(data)
data_hash = data_hash['public_holidays']

data_hash.each do |d|
	p d
end