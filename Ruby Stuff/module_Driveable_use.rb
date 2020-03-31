require './module_Driveable.rb'

class C1
	include Driveable # подключаем модуль к классу
	def m1
		puts :m1
	end;	
	# ...some code here
end;

class C2	
	include Driveable # подключаем модуль к другому классу
	def m2
		puts :m2
	end;	
	# ...some more code here
end;

# Ключевое слово include служит для включения модуля в состав класса. Все "методы экземпляра" модуля (т.е. без self) становятся методами экземпляра класса

d1=C1.new
d1.m1
d1.drive # метод, взятый из модуля

d2=C2.new
d2.m2
d2.drive # метод, взятый из модуля

class C3
	extend Driveable
end;

print "C3 is... "
C3.drive	