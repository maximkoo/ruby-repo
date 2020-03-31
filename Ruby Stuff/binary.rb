a=200;
p=[]
r=""
16.times do |i|
	x=1
	i.times do 
		x=x*2
	end;
	p<<x
	r+="0";
end;
#puts p;
#puts "----"

while a>0 do
	b=p.select{|i| i<=a}.max
	a=a-b
	#puts p.index(b)
	r[p.index(b)]="1"
end;

puts "---"
puts r.reverse

