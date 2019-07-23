a=nil
puts a==0

puts nil||true
puts nil||false
puts nil&&true
puts nil&&false

puts "x" if !a 
puts "----"
b=nil
#puts nil.methods.to_a
puts a.equal? b # true


class NilClass
	def self.new
		nil;
	end;
end;	

c=NilClass.new
puts a.equal? c	

puts 'abc'.reverse