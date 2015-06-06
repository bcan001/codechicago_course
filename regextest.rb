# example
array = ["aggg","Timmy","1234","32","345"]

array.each do |element|
	if element =~ /\d/
		p element
	end
end

array.each do |element|
	if element =~ /[a-z]/
		p element
	end
end



str1 = "Joe Schmo, Plumber"
str2 = "Stephen Harper, Prime Minister"

re = /(\w*)\s(\w*),\s?([\w\s]*)/

match1 = str1.match re
match2 = str2.match re

p match1
p match2

p match1.string
p match1[1]
p match1[2]

num = "125"
regex = /\d{3}/
p num.match regex