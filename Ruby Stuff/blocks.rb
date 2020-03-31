
# Метод, который умеет запускать переданный ему блок
def m1
	yield if block_given?
end;

# Вызов этого метода с передачей блока
m1 do 
	puts "TROLOLO"
end;

# Метод, который умеет запускать переданный ему блок просто так или по имени
def m2(&block) # этот метод ожидает параметр, который обязательно должен быть блоком
	# ко всякому переданному параметру применяется to_proc
	yield if block_given? # просто запускаем переданный блок
	block.call if block_given?	# запускаем переданный блок по имени (по существу то же самое)
end;	

#m2(5) # так работать не будет, потому что у Fixnum нет метода to_proc

m2 do #так работает ОК
	puts "Passing a block"
end;

b=proc{puts "Passing a proc"} #переменная-процедура
# чтобы дать понять, что мы передаём блок, приписываем в начале &
m2(&b) #так тоже работает ОК
#m2(b) wrong number of arguments (1 for 0) 
# то есть аргументы с & аргументами как бы не считаются ни при передаче, ни при приёме

def m3 # для примера ещё один метод, который умеет запускать блок
	yield if block_given?
	puts "m3 successful"
end;	

m3(&b) # передаем ему переменную-процедуру, всё ОК

# Как уже было сказано выше, если мы что-то передаем под видом блока, то к нему применяется to_proc
# То есть у того, что мы передаём, должен быть метод to_proc
class C1 # просто какой-то ничего не значащий класс
	def to_proc # но у него есть метод to_proc
		proc{puts "Class into proc"} # который возвращает переменную-процедуру
	end;	
end;

m3(&C1.new) #работает ОК, запускается блок из переменной-процедуры

# А что, елси передать блок и параметрои и через do ?
#m3(&b) do
#	proc{puts "supposed to be an error"} # both block arg and actual block given # ошибка синтаксиса, не исключение
#end;	

# Теперь такие же фокусы, но с методами
# определим метод
def m4 
	puts "This is m4 method"
end;	

mlink=method(:m4) #переменная-метод

m3(&mlink) #передаем метод m4, как блок в метод m3
#m3.mlink
m3(&m4) # так тоже работает, можно не заводить переменную

# Но с переменной удобно потому, что можно в неё динамически подсовывать генерируемые названия методов
puts "-------- DYNAMIC -----------"
(1..3).each do |i|
	mlink=method("m#{i}") # на лету сочиняем имя метода
	print "Trying #{mlink.name}... : " 
	m3(&mlink) #и передаем его в метод m3, причем в какой-то момент метод m3 получит сам себя в качестве параметра ))
end;

puts "-- with param --"
# метод с параметром
def m10(p) 
	yield(p) if block_given? # параметр передается в блок, как будто это отдельная процедура
end;

m10(10) do |x|
	puts "TROLOLO with param #{x}" # вообразив, что блок - это отдельная процедура, укажем, где в ней должны использоваться взходые параметры
end;

def m11(p, &blk) #входной параметр для блока и сам блок
	blk.call(p)
end;	

m11(11) do |x|
	puts "TROLOLO with param #{x}"
end;

#x=100;
bl=Proc.new {|x|puts "TROLOLO with param #{x}"} # одно 
bl=proc{|x|puts "TROLOLO with param #{x}"} # и то же

m11(20, &bl) #=>TROLOLO with param 20

def m12(p1,p2,p3, &blk)
	blk.call(p1,p2,p3)
end;

bl2=proc{|a,b,c| puts "TROLOLO with params #{a} #{b} #{c}"}
m12(21,22,23, &bl2) #=>TROLOLO with params 21 22 23

def m12a(p1,p2,p3, &blk)
	yield(p1,p2) # два параметра передаем в блок
	puts "The third parameter is #{p3}" # один параметр испоьзуем прямо тут
end;

m12a(31,32,33, &proc{|a,b|puts "TROLOLO with params #{a} #{b}"}) #ОБРАТИТЕ ВНИМАНИЕ: & перед proc # Это как бы не параметр - ЭТО БЛОК!

