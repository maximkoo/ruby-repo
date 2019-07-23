class C1	
	def initialize(p)
		@p=p;
	end;	

    def p=(x)
    	@p=x
    	puts self
    end;	

    def p
    	@p
    end;	
end;

d=C1.new(5)
puts d.inspect
d.p=10;
d1=d.clone;
d2=d.dup;
puts d1.inspect
puts d2.inspect
