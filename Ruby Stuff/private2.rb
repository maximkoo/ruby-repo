class C1
	def a
		@a		
	end;

	def a=(x)
		@a=x
	end;

	def get_c(e) # метод доступа к protected-методу другого экземпляра класса
		e.c
	end;
	
	def set_c(e, x)# метод доступа к protected-методу другого экземпляра класса
		e.c=(x)
	end;

	private
	def b
		@b		
	end;

	def b=(x)
		@b=x
	end;

	protected
	def c
		@c		
	end;

	def c=(x)
		@c=x
	end;	
end;

c1=C1.new
c1.a=1
puts c1.a
#c1.b=2 # так нельзя
#puts c2.b # так нельзя, к private-методу можно обращаться только внутри описания класса
c2=C1.new
c2.set_c(c1,5)
c2.get_c(c1)

