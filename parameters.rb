puts "1. Параметры именованные обязательные. Передавать надо ровно два параметра, по позиции или по имени"
def m1(param1, param2)
	puts param1,param2
end;

#m1("parameter1");# wrong number of arguments
m1("parameter1",'parameter2')
m1(param2="parameter2",param1="parameter1")
#m1(param2="parameter2") # wrong number of arguments
#m1({"param1"=>"parameter1","param2"=>"parameter2"}) # так нельзя (см. ниже)

puts "2. Default-параметры. Можно передавать не все, по позиции или по имени"
def m2(param1="parameter1", param2="parameter2")
	puts param1,param2
end;

m2("parameter1")
m2(param2="parameter2")

puts "3. Неопределённое количество безымянных параметров"
def m3(*param)
	puts param[0],param[1],param[2]
end;
m3("parameter1","parameter2","parameter3") 
# *param1 истолковывается, как массив
# обращение через param[0],param[1],param[2]

puts "4. Keyword parameters"
def m4(param1:, param2:) # именованные параметры в стиле Ruby 2.0, 
	puts param1, param2
end;

#m4("parameter1") # wrong number of arguments
#m4("parameter1","parameter2") # wrong number of arguments
# m4(param1="parameter1",param2="parameter2") # wrong number of arguments
m4(param1:"parameter1",param2:"parameter2")
m4({param1:"parameter1",param2:"parameter2"}) # можно передавать один хэш
#m4("parameter1",'parameter2') # так нельзя, только по именам

puts "5. Keyword default parameters"
def m5(param1: "parameter1", param2: "parameter2")
	puts param1, param2
end;

m5(param1:"parameter1",param2:"parameter2")
m5(param1:"parameter1");
m5({param1:"parameter1",param2:"parameter2"})
	

# *zoo="q","w","e"
# puts zoo.to_s
