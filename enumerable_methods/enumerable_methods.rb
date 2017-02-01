module Enumerable
	def my_each
		i=0
		while i<self.length
			yield(self[i])
			i+=1
		end
		return self
	end

	def my_each_with_index
		i=0
		while i<self.length
			yield(self[i], i)
			i+=1
		end
		return self
	end

	def my_select
		select_array=[]
		self.my_each do |element|
			if yield(element)==true
				select_array.push(element)
			end
		end
		return select_array
	end

	def my_all?
		all_true=true
			self.my_each do |element|
				if yield(element)==false
					all_true=false
				end
			end
		return all_true
	end

end



puts [1,4,7,9].my_all? {|number| number>4}



