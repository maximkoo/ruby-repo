Предположим, что нам в игре требуется большое количество врагов нескольких разных видов
Можно было бы завести несколько классов самих врагов и несколько их "генераторов" (spawner)
Но можно завети только один spawner, который будет клонировать любой переданный ему объект

class Monster # класс врага №1
	def initialize
		@power=20;
		@speed=100;
		@teeth=32;
	end;	
	def attack
		puts "Monster attacks"
	end;
end;

class Goblin # класс врага №2
	def initialize
		@power=10;
		@speed=50;
		@teeth=12;
		@magic=5
	end;
	def attack
		puts "Goblin attacks"
	end;
end;

class Spawner # единственный spawner, можно создавать его, как объект, можно обойтись, как я думаю
	def self.spawn(obj) 
		obj.clone # в Руби очень легко клонировать
	end	
end;	

m=Monster.new; # прототип монстра
g=Goblin.new; # прототип гоблина

m1=Spawner.spawn(m) #клонируем монстра 
puts m1.inspect # он точно такой же, как и первый
m1.attack # работает норм

g1=Spawner.spawn(g) #клонируем гоблина
puts g1.inspect
g1.attack
