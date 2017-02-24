require 'enumerable_methods'
	
describe Enumerable do 
	subject{[10,20,30,40,50]}

	describe "#my_each" do
		context "apply given block to each element of array" do
			it "returns self" do
				array =[]
				subject.my_each{|element| array << element/10}
				expect(array).to eql([1,2,3,4,5])
			end
		end
	end

	describe "#my_each_with_index" do
		context "when given a block" do
			it "the index is available" do
				indices=[]
				subject.my_each_with_index {|element, index| indices << index}
				expect(indices).to eql([0,1,2,3,4])
			end
		end
	end

	describe "#my_select" do
		context "when given a block" do
			it "returns all elements that make block true" do
				expect(subject.my_select{|element| element>20}).to eql([30,40,50])
			end
		end
	end

	describe "#my_all?" do
		context "when given a block" do
			it "determines if block returns true for each element" do
				expect(subject.my_all?{|element| element<100}).to eql(true)
			end
		end
	end

	describe "#my_none?" do
		context "when given a block" do
			it "determines if block returns false for each element" do
				expect(subject.my_none?{|element| element<30}).to eql(false)
			end
		end
	end

	describe "#my_count" do
		context "when block is given without parameter" do
			it "returns how many elements return true for a given block" do
				expect(subject.my_count{|element| element<20}).to eql(1)
			end
		end

		context "when parameter is given without a block" do
			it "returns how many elements match the given parameter" do
				expect(subject.my_count(50)).to eql(1)
			end
		end

		context "when no block is given and no parameter is given" do
			it "returns the size of self" do
				expect(subject.my_count).to eql(5)
			end
		end
	end

	describe "#my_map" do
		context "when a proc is given as a parameter" do
			it "applies the block to each element and returns new array" do
				proc = Proc.new {|element| element/10}
				expect(subject.my_map(proc)).to eql([1,2,3,4,5])
			end
		end

		context "when a proc is not given as parameter and block is given" do
			it "applies block to each element and returns modified array" do
				expect(subject.my_map {|element| element+20}).to eql([30,40,50,60,70])
			end
		end
	end

	describe "#my_inject" do
		context "when block is given without parameter" do
			it "applies block to first and second element, takes result and applies that to next element and so on" do
				expect(subject.my_inject{|result, element| result+element}).to eql(150)
			end
		end

		context "When parameter and block are given" do
			it "initial value is set to parameter" do 
				expect(subject.my_inject(5){|result, element| result+element}).to eql(155)
			end
		end
	end
end

describe "#multiply_els(array)" do
	context "when given an array as an argument" do
		it "multiplies every element in the array" do
			expect(multiply_els([10,20,30,40,50])).to eql(12000000)
		end
	end
end
