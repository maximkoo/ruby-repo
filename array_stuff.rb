@x=10;
a=Array.new(@x){Array.new(@x,0)}

a[8][3]=5

i=0;
@x.times do 
	@x.times do |k|
	print a[i][k]
	end;	
	puts;
	i=i+1
end;	
puts
print a[8][3]

def getCellNum(row, col)
 (row-1)*@x+col
end;	

puts
puts getCellNum(8,3)