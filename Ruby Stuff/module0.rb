module M2able
	def module_method
		puts "module_method"
	end;

	def self.self_module_method
		puts "self_module_method"
	end;	
end;	

M2able.self_module_method #работает только вот так, но никуда не передается

class C1
	include M2able
	def usual_instance_method
		puts "usual_instance_method"
	end;	
end;

x=C1.new;
x.usual_instance_method
x.module_method
## C1.self_module_method #=> не работает !

class C2
	class<<self
		include M2able
	end;	
end;	
C2.module_method # теперь уже, как статический метод
# C2.self_module_method # все равно не работает

class C3
	extend M2able #подключаем методы модуля, как методы класса
end;	

C3.module_method; # работает, как метод класса
#C3.self_module_method #=> а так все равно не работает !

class C4 #пустой класс
end;

C4.extend M2able # подключаем модуль отдельно
C4.module_method # работает ОК

class C5	
	include M2able
	def module_method #=> метод переопределяется
		puts "kokok"
	end
end;

c5=C5.new
c5.module_method

