a=[1,2,3]
aa=[]

class Itrtr
 	def initialize(arr, &b)
 		if block_given?
 			for x in arr do
 				b.call(x)
 			end;
 		end;
 	end;	
 end;

 class Array
 	def every(&b)
 		Itrtr.new(self, &b)
 	end;
 end;

 a.every do |i|
 	aa<<i+=1 	
 end;	

puts aa.to_s #=>[2, 3, 4]