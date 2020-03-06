begin
a="a"+1
rescue TypeError
	puts $! #no implicit conversion of Fixnum into String # сообщение об ошибке
end;	

begin
#a="a"
b=5/0
rescue TypeError=>exc
	puts $! #no implicit conversion of Fixnum into String # сообщение об ошибке
	puts exc #no implicit conversion of Fixnum into String # сообщение об ошибке # вроде как то же самое
	puts exc.kind_of?(TypeError) #=> true
	puts exc.instance_of?(TypeError) #=> true
rescue ZeroDivisionError
	puts "Zero division detected!"
rescue StandardError
	puts $!
	#raise # передаем Standart Error в вызывающий блок
	# или же
	raise "A standart error raised" # передаем StandartError с сообщением
else # выполняется в том случае, если не было ошибок
	puts "Everything worked fine without any exception!"	
ensure # выполняется  влюбом случае
	puts "Done in any case - whether there was an exception or not!"
end;

puts "========"
#подробнее про raise
def m1
	begin
	5/0
	rescue ZeroDivisionError 
		raise "YOU DIVIDED BY ZERO!!!111"
	end;	
end;

begin
m1;	
rescue Exception => e
	puts e #выводится "YOU DIVIDED BY ZERO!!!111"
end	

puts "========"