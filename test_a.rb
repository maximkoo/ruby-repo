a=[1,2,3]
a.each do |q|
	puts q
	a<<4 if q==2
end;