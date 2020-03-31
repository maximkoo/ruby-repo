puts 5+1

puts Fixnum.instance_methods.grep /^\W/

#puts 5.methods.grep /^\W/

puts 5.+(1)

class Fixnum
	def +(a)
		#self-a
		puts "#{self}+#{a}=#{self-(-a)}"
		self-(-a)
	end;
end;		

puts 5+1+100+123+457+2+77+12 #=> 4