eval "puts 1"

class C1
	eval "puts 1"
end;

puts "**"
C1.class_eval("puts self")
C1.new.instance_eval("puts self")
puts "**"

class C1
	eval "def m1 
			puts 1 
		end"
end;

C1.new.m1

#C1.eval "def m1 
#	puts 1 
#	end"

class C1
	puts self
	eval "puts self"
end;

# C1.class_eval("def m1 \n end")	
# C1.class_eval("def C1.m3 \n end")	
# C1.instance_eval("def m2 \n end")
# C1.instance_eval("def C1.m4 \n end")
# puts C1.methods.grep /^m[0-9]/
# puts "---"
# puts C1.new.methods.grep /^m[0-9]/

C1.class_eval("def m2 \n puts :m2 \n end")	
C1.class_eval do 
	def m2 
		puts :m2 
	end
end;

C1.new.m2

class C2
	def m1
		eval "puts self"
	end;	
end;

C2.new.m1

###

class C3
	define_method (:m1) do |p1,p2|
		puts "#{p1} #{p2}"
	end;	
end;

C3.new.m1(1,2)	

class C3
	class<<self
	define_method (:m2) do |p1,p2|
		puts "#{p1} #{p2}"
	end;	
end;
end;

C3.m2(1,2)	