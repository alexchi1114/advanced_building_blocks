def my_each
	i=0
	while i<self.size
		yield(self[i])
		i+=1
	end
	return self
end

puts my_each([1,2,3,4]) do |element|
	element
end