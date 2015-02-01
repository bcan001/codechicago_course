arr = [[78,66,88,59],[66,77,58],[99,23]]

def avg(array)
	# array = [1,2,3,4]
	count = 0
	array.each do |u|
		count += u
	end
	count/array.length
end

p avg(arr[0])
p avg(arr[1])
p avg(arr[2])