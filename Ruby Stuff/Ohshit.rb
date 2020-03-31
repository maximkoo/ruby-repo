def m1
	yield # выполняется блок - создается класс
	c=C1.new # работает норм
	c.m2 # работает норм
end;

m1 do
	class C1 # внутри блока объявляем класс
		def m2 # с методом
			puts :m2
		end;	
	end;
end;		

def m3
	yield # создается метод
	m4  # работает норм
end;

m3 do
	def m4 # внутри блока объявляется метод
		puts :m4
	end;	
end;		