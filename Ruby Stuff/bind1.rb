def m1
	a=200
	puts binding
	puts "in m1 a=#{binding.local_variable_get(:a)}"
	yield
end;

a=100
m1 do 
	puts binding
	puts "in the block a=#{binding.local_variable_get(:a)}"
	puts a
end	