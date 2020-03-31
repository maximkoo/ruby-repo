class C1
	
end;

C1.class_eval do
	def m1
		puts self
	end;	
end

C1.instance_eval do
	def m3
		puts self
	end;	
end

C1.new.m1
C1.m3