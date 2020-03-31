class C1
	def m1(a)
		puts "Method m1 is run with param #{a}";
	end;
end;

x=Hash.new
x["m1"]=1

c=C1.new
x.each do |key, value|
	c.send(key, value) #Method m1 is run with param 1
end;	

c.send("m1",x["m1"]) #Method m1 is run with param 1

# Если надо передать несколько параметров
class C1
	def m2(*a)
		puts a
	end;
end;

c.send("m2",[10,20])
