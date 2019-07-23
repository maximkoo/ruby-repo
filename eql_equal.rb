class C1
	attr_accessor :a;
	def initialize(x)
		@a=x;
	end;	
end;	

c1=C1.new(1);
c2=C1.new(1);
c3=c1;
c4=C1.new(4);

puts c1==c2;
puts c1.eql? c2
puts c1.equal? c2

puts c1==c3;
puts c1.eql? c3
puts c1.equal? c3

####
puts "---------"
a=1
b=a
c=1
d=1.0
s1="str"
s2="str"
sym1=:sym
sym2=:sym

puts "--- equal?"
puts a.equal? b # true Один и тот же объект
puts a.equal? c # true для каждого числа Fixnum существует только один экземпляр, поэтому и #свойства object_id у них одинаковые. Однако, это не значит, что при изменении c, изменится a
puts a.equal? d # false Разные объекты и к тому же из разных классов - Fixnum и Float
puts s1.equal? s2 #false Разные объекты, хоть и одного класса и по значению совпадают
puts sym1.equal? sym2 #true - одинаковые символы всегда указывают на один объект 

puts "--- eql?"
# Проверяет равенство по значению и совпадение класса
puts a.eql? b # true Один и тот же объект
puts a.eql? c # true Объекты разные, но равны по значению и относятся к классу Fixnum
puts a.eql? d # false Объекты хоть и равны по значению 1=1.0, но относятся к Fixnum и Float
puts s1.eql? s2 # true 
puts sym1.eql? sym2 # true

puts "---=="
# == проверяет равенство по значению, не обращая внимания на класс. Во всяких самодельных классах лучше переопределять самому
puts a==b # true
puts a==c # true
puts a==c # true
puts s1==s2 # true
puts sym1==sym2 #true