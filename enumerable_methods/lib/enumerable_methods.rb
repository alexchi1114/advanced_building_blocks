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

	def my_none?
		all_false=true
		self.my_each do |element|
			if yield(element)==true
				all_false=false
			end
		end
		return all_false
	end

	def my_count(item=nil)
		count=0
		if block_given?
			self.my_each do |element|
				if yield(element)==true
					count+=1
				end
			end
		elsif item!=nil
			self.my_each do |element|
				if item==element
					count+=1
				end
			end
		else
			count=self.size
		end
		return count
	end

	def my_map(proc=nil)
		new_obj=[]
		i=0
		if proc!=nil 	
			while i<self.length
				new_obj.push(proc.call(self[i]))
				i+=1
			end
		else
			while i<self.length
				new_obj.push(yield(self[i]))
				i+=1
			end
		end
		return new_obj
	end

	def my_inject(arg=nil)
		if arg==nil
			i=1
			result=self[0]
			while i<self.size
				result=yield(result, self[i])
			i+=1
			end
		else
			i=0
			result=arg
			while i<self.size
				result=yield(result, self[i])
				i+=1
			end
		end
		return result
	end
end

def multiply_els(array)
		array.my_inject {|product, element| product*element}
end





