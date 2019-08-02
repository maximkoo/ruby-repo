puts (28712-28445)*5.16+(10786-10677)*1.35+(12517-12232)*4.30
a=[1,2,3,4,5]
puts a.reduce(&:+)
class Fixnum
def qq
	self+1;
end;	
end;

class Fixnum
def qqq(p)
	self+p;
end;	
end;

a.map! do |i| 
	i+1;
end;
puts a.to_s;

puts a.map!(&:qq).to_s;

