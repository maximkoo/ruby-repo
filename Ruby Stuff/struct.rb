Point=Struct.new(:x,:y) # Создаем новый класс по типу Struct

point=Point.new(100,200); # Экземпляр нового класса

# Поля сразу доступны через методы или же как элементы хэш-массива с ключами-символами или строками
puts point.x, point.y #=>100,200
puts point[:x], point[:y] #=>100,200
puts point["x"], point["y"] #=>100,200

point.x=150; point.y=250;
puts point.x, point.y #=> 150,250

class Point 
	def newMethod
		puts "This is new method, x=#{self.x}, y=#{self[:y]}"
	end;	
end;

point2=Point.new(1000,2000); # Экземпляр нового класса
point2.newMethod	

puts point2.instance_variables.to_s #=> []
puts Point.class_variables.to_s #=> []
puts
puts Point.methods(false).to_s #=> [:new, :[], :members]
puts Point.members.to_s# => [:x, :y]
