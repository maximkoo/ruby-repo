class Lamp # Общий класс
	@@a=0 # здесь находится счётчик созданных экземпляров
	def initialize		
		@@a+=1
	end;	

	def self.lampCount
		@@a
	end;	
end;

class BlueLamp<Lamp # три конкретных класса
	def initialize
		super
	end;	

	def light
		puts "Blue light"
	end;		
end;

class RedLamp<Lamp
	def initialize
		super
	end;

	def light
 		puts "Red light"
 	end;
end; 

class GreenLamp<Lamp
	def initialize
		super
	end;

	def light
 		puts "Green light"
	end;
end;	

class Tree # Дерево, на которые вешаются цветные лампы
	@@a=0 # количество ламп на дереве
	def hang_a_lamp(lamp) # вешаем лампу
		lamp.light;	
		@@a+=1;
	end;

	def self.lampCount
		@@a
	end;	

	def decorate # генерируем рандомные лампы и вешаем их на дерево
		a=[BlueLamp.new,RedLamp.new,GreenLamp.new];
		10.times do |x|
			hang_a_lamp(a[rand(100)%3]);
		end;
	end;	
end;

tree=Tree.new;	
tree.decorate;
puts "Lamps on the tree: #{Tree.lampCount}" # на дереве 10 ламп
puts "Lamps generated: #{Lamp.lampCount}" # а сгенерировано только три объекта