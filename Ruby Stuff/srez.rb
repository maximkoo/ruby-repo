a=[1,2,3]
b=a
puts a.object_id
puts b.object_id
b<<4
puts a.object_id
puts b.object_id


s="abc"
puts s.object_id
s<<"d"
puts s.object_id
#s="abcde"
s=String.new("abcde");
puts s.object_id

######
puts "------------"
aa=5
bb=aa
puts aa,bb
aa=6
puts aa,bb

aa=[1,2,3,4,5]
bb=aa
puts aa.to_s,bb.to_s
aa<<6
puts aa.to_s, bb.to_s
aa=[1,2,3,4,5,6,7,8,9]
puts aa.to_s, bb.to_s

aa="abc"
bb=aa
puts aa,bb
aa<<"d"
puts aa,bb
aa="abcde"
puts aa,bb

class C1
	attr_accessor :n
	def initialize(n)
		@n=n
	end;
end;

aa=C1.new(10);
bb=aa;
puts aa.n, bb.n
aa.n=aa.n+1;
puts aa.n, bb.n
