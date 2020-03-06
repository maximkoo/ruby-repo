#http://stackoverflow.com/questions/4467538/what-does-the-operator-do-in-ruby
#http://stackoverflow.com/questions/3422223/vs-in-ruby

#"Тройное равно" - на самом деле никакое не равенство, правильнее его называть "оператор отнесения"
# он не обладает свойством реверсивности, т.е., если a===b то не b!===a
# и также свойством транзитивности, т.е. если a===b и a===c, то не обязательно b===c

# этот оператор позволяет оценить, можно ли правый операнд зачислить в левый, являющий собой более общую сущность
puts "---1"
puts "a"==="a" #=> true
puts 1===1 #=> true
puts "AAA"==="A" #=> false
puts (1..3)===2 #=> true # === работает, как include?
puts [1,2,3]===2 #=> false Array#=== is not defined as membership in ruby 1.8 or 1.9.1. Range#=== is though.
puts "---2"

puts Fixnum===1 #=> true
puts Object===String #=> true
puts String==="A" #=> true
puts Symbol===:sym #=> true
puts [1,2,3].is_a?(Array)#=> true Одно и
puts Array===[1,2,3]#=> true То же
puts Hash==={:a=>1,:b=>2}#=> true
puts Proc===proc{puts "A"} #=> true
puts "---3"

puts /OLO/==="TROLOLO" #обратите вниманье, тут регулярное выраженье
puts /^TRO/ === "TROLOLO" # === работает, как =~ except returning a boolean
puts /LOLO$/ === "TROLOLO"
puts /[OL]/ === "TROLOLO"
puts "---4"

class C1
	def C1.m1
		puts "m1"
	end;

	def m2
		puts "m2"
	end;
end;		

puts C1.is_a?(Class) #=> true То есть это
puts Class===C1 #=> true одно и то же
puts Class===C1.new #=> false # логично
puts C1.new.is_a?(Object) #=> true То есть это
puts Object===C1.new #=> true одно и то же
puts C1.method(:m1).is_a?(Method)
puts Method===C1.method(:m1) #=> true
puts C1.new.method(:m2).is_a?(Method)
puts Method===C1.new.method(:m2) #=> true

puts "---5"
x="TROLOLO"
case x
when /OLO/
	puts "TRUE" #=> TRUE, потому что case использует ===, а не ==
end;	
x=3
case x
when (1..5)
	puts "TRUE"  #=> TRUE, потому что case использует ===, а не ==
end;	
x=:s
case x
when Symbol
	puts "TRUE"  #=> TRUE, потому что case использует ===, а не ==
end;

