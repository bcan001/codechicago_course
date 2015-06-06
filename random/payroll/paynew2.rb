require "rexml/document"


file = File.open("public_holidays.xml")
doc = REXML::Document.new file
file.close



doc.elements.each("dates/holiday") do |element|
  puts element
end

puts

doc.elements.each("dates/holiday/day") do |element|
  puts element
end