class C1
	def self.m1
		puts :m1
	end;
end;

d=C1.new
		
def d.m2
	puts :m2
end;

class<<d
	m1
end;			