class C1
	def self.m1 #метод класса ("статический")
		puts "m1 method"
	end;

	def m2 #обычный метод
		puts "m2 method"
	end;
end;

C1.m1
q=C1.new
q.m2

#при этом
#C1.m2 #undefined method `m2' for C1:Class (NoMethodError)
#q.m1 #undefined method `m1' for #<C1:0x2f63898> (NoMethodError)

#Другой способ создания метода класса
class C2
	class<<self #self теперь означает класс, а не экземпляр
		def m1 #метод класса
			puts "C2.m1 method"
		end;
		def m2 #тоже метод класса
			puts "C2.m2 method"
		end;
	end;	
	def m3 #метод экземпляра
		puts "C2.m3 method"
	end;	
end;	

C2.m1
C2.m2
q=C2.new
q.m3

#Третий способ
class C3
end;

def C3.m3 #описание метода класса вне описания класса
	puts "C3.m3 method"
end;

C3.m3;	
w=C3.new
#w.m3; #undefined method `m3' for #<C3:0x2d22bf0> (NoMethodError)
