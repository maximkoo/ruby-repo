## 1. Создание класса
puts "1. ============="
class C1
 def initialize 
  @desc="This is c1 class"
  puts @desc
 end; 
 def m1(i)
  i+1
 end;
 def m2(i)
  i+2
 end; 
 puts "Created C1 instance"
end;

inst=C1.new
a=0;
puts "Test m1 method", inst.m1(a);
puts "Test m2 method", inst.m2(a);

##
## 2. То же самое, но экземпляр создаётся с параметром
##
puts "2. ============="
class C2
 def initialize desc
  @desc=desc
  puts "This is c2 class: #{desc}"
 end; 
 def m1(i)
  i+1
 end;
 def m2(i)
  i+2
 end; 
 def get_desc
  @desc
 end;
 puts "Created C2 instance"
end;

inst=C2.new "my description"
a=0;
puts "Test m1 method", inst.m1(a);
puts "Test m2 method", inst.m2(a);
puts "The description is: "+inst.get_desc

##
## 3. Способ создания экземпляра без new
puts "3. ============="
inst=C2.allocate #initialize не вызывается !
##
## 4. Как бы "перегрузка конструктора"
puts "4. ============="

class C4
 def initialize desc="", amount=0 #Значения по умолчанию
 @desc=desc
 @amount=amount
 end
 def get_desc
  @desc
 end
 def get_amount
  @amount
 end  
end

inst1=C4.new
inst2=C4.new("OLOLO")
inst3=C4.new("OLOLOLOL",10)
puts inst1.get_desc, inst1.get_amount
puts inst2.get_desc, inst2.get_amount
puts inst3.get_desc, inst3.get_amount
# или же
puts inst3.send :get_amount #вызов метода по имени

puts "5. ============="
class C5
 @@pi=3.14 #Относится к классу - не к объекту!
 def get_area(r)
  puts @@pi*r*r
 end;
end;

inst=C5.new
inst.get_area(5)
inst.get_area(6) 

puts "6. ============="
class C6
 def initialize 
   puts "C6 created"
 end;
end;
 
class CC6 < C6
 def initialize
  super ## (необязательно) вызывает метод initialize класса С6
  puts "CC6 created"
 end;
end; 

CC6.new;
p CC6.ancestors