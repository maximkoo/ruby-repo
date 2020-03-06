class Fth
	@@sides=0 # переменная класса
	@sux=0 #переменная "метакласса", т.е. экземпляра класса Class, на схеме прямоугольник
	def initialize
		@@sides+=1 # переменная класса
		@sux=100 # переменная экземпляра класса Fth, из передаваемой части, на схеме овал (НЕ ТО ЖЕ САМОЕ, ЧТО ВЫШЕ)
	end;	

	def self.getSides
		@@sides
	end;	

	def getSides
		@@sides
	end;	

	def self.getSux
		@sux
	end;
	
	def getSux	
		@sux
	end;
		
end;

aaa=[]
(1..5).each do |i|
	aaa.push(Fth.new)
	puts Fth.getSides;
end; # Возвращает 1 2 3 4 5 # то есть количество экземпляров класса Fth на каждой итерации

puts aaa[1].getSides; #5

puts Fth.getSux # Возвращает 0 
puts aaa[1].getSux; #Возвращает 100 ***Это две разные переменные, совпадают имена, но различаются контексты

class Fth2<Fth
 puts %{inherited class: #{self.name}}
end;

puts Fth2.getSides;	# возвращает 5, то есть унаследовалась не только переменная класса, но и её значение
puts Fth2.getSux;	#nil, переменная не инициализирована
puts Fth2.new.getSux; #возвращает 100, переменная инициализирована при создании экземпляра