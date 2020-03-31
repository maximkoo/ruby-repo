Qwerty=Struct.new(:field1, :field2, :field3) do
	def marshal_dump
		puts "This is marshal_dump in Qwerty"	
	end;	
end;

q1=Qwerty.new(1,2,3);

q1_dump=Marshal.dump(q1) 
puts q1_dump; #S:Qwerty:field1i:field2i:field3i

# class Array
# 	def marshal_dump
# 		puts "This is marshal_dump in Arr"
# 		return self.to_s
# 	end;	

# 	def marshal_load(a)
# 		puts a.split(",")
# 		#return Array.new(a.split(","))		
# 		a[1..-2].split(", ").each do |x|
# 			self<<x.to_i
# 		end;	
# 	end;	
# end
# puts 
# arr=[1,2,3,4,5]
# x=Marshal.dump(arr);
# puts x
# xx=Marshal.load(x)
# puts "xx=#{xx.to_s}"
#puts '[1,2,3,4,5]'.split(",")


puts "-------------------"

class Array
	def marshal_dump
		puts "This is marshal_dump in Array"
		return self.join(",")		
	end;	

	def marshal_load(a)
		puts "This is marshal_load in Array"
		self<<a.split(",")			
	end;	
end

arr=[1,2,3,4,5]
arr_dumped=Marshal.dump(arr)
puts arr_dumped
arr_restored=Marshal.load(arr_dumped)
puts arr_restored


q={}.tap do |qq|
	qq[:x]=100
end;

puts q;	