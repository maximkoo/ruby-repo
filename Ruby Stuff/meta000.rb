s="Trololo"
def s.m1
	puts "X"
	puts "self.class=#{self.class}" #=> String
	#puts "self.name=#{self.name}"
	#puts "self.superclass=#{self.superclass}" #=>
	class << self
		def ololo
			puts "ololo"
			puts "self.class=#{self.class}" #=> String
		end;
	end;	
end;

class<<s
	def qqq
		puts "qqq;"
		puts "self.class=#{self.class}" #=> String
	end;
	def new
		self;
	end;	
end;	
		

s.m1;	
s.ololo;
s.qqq;

#a=w.new

a=s.new;
a.ololo
a.qqq;
puts "a.class=#{a.class}" #=>

m=class<<s; self; end;
puts "*****"
puts m.instance_methods.grep(/m1/)#=>m1
puts m.instance_methods.grep(/qqq/)#=>qqq
puts String.instance_methods.grep(/qqq/)#=> ничего нет