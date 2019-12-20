puts "1."
def m1(param1, param2)
	puts param1,param2
end;

#m1("parameter1");# wrong number of arguments
m1("parameter1",'parameter2')
m1(param1="parameter1",param2="parameter2")

puts "2."
def m2(param1="parameter1", param2="parameter2")
	puts param1,param2
end;

m2("parameter1")

puts "3."
def m3(*param1)
	puts param1
end;
m3("parameter1","parameter2","parameter3") 


puts "4."
def m4(param1:, param2:) # именованные параметры в стиле Ruby 2.0
	puts "#{param1},#{param2}"
end;

#m4("parameter1") # wrong number of arguments
#m4("parameter1","parameter2") # wrong number of arguments
m4(param1:"parameter1",param2:"parameter2")
m4({param1:"parameter1",param2:"parameter2"})
#m4("parameter1",'parameter2') # так нельзя, только по именам

puts "5."
def m5(param1: "parameter1", param2: "parameter2")
	puts param1, param2
end;

m5(param1:"parameter1",param2:"parameter2")
m5(param1:"parameter1");
m5({param1:"parameter1",param2:"parameter2"})
	

# *zoo="q","w","e"
# puts zoo.to_s
