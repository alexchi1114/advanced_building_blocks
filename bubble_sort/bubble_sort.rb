def bubble_sort(array)
	switched=true
	while switched==true
		switched=false
		for i in 0...array.length-1
			if array[i]>right=array[i+1]
				array[i], array[i+1] = array[i+1], array[i]
				switched=true
			end
		end
	end
	return array
end

puts bubble_sort([3,2,5,6,2,1])

def bubble_sort_by(array)
	switched=true
	while switched==true
		switched=false
		for i in 0...array.length-1
			if yield(array[i], array[i+1])>0
				array[i], array[i+1] = array[i+1], array[i]
				switched=true
			end
		end
	end
	return array
end

puts bubble_sort_by(["hi","hello","hey"]) {|left,right| left.length - right.length}
