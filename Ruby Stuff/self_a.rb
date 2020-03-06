class C1
	attr_accessor :a
	@a=1
	@b=0

def C1.b=(q)
	@b=q
end;

def C1.b
	@b
end;


	def initialize(x)
		@a=2		
		self.b=x # черех метод экземпояра
		@b=4 # напрямую к меременной
	end;

def b=(q)
	@b=q
end;

def b
	@b
end;		

	# def m1
	# 	puts @a
	# end;
	# puts @a
end;

#C1.new(3).m1
puts C1.new(3).b
puts C1.b
