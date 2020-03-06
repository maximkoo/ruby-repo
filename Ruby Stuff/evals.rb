class C1
	class_eval("puts self");
	instance_eval("puts self");
	C1.class_eval("puts self");
	C1.instance_eval("puts self");
	puts "---0"
	class<<self
		class_eval("puts self");
		instance_eval("puts self");
	end;	
	puts "---1"
	def m1
		#class_eval("puts self");
		instance_eval("puts self"); #=> #<C1:0x2bd2878> экземпляр класса Class
	end;
	def m2
		self.class.class_eval("puts self");
		self.class.instance_eval("puts self");
	end;	
	def m3
		a=0;
		class<<self;
			class_eval("puts self");
		end;
		class<<self	
			self.instance_eval("puts self");
		end;	
	end;	
end;
C1.new.m1;
puts "---2"
C1.new.m2;
puts "---3"
C1.new.m3;
a=C1.new
a.class.class_eval("puts self");
a.class.class_eval do 
	puts self
end;
a.instance_eval do 
	puts self
end;

