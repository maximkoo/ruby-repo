a=["aaa","bbb", "ccc", "--last",'111',"--latest", "6"]
b=a.select{|x| /^--/===x}
puts b
puts "----------"
a=a-b
puts a
puts "===="
c=a.select{|x| /[0-9]/===x}
puts c

puts "========"

puts "11111111"
x=[[0,1],[1,2]]
puts x.to_s
class Array
def trans
	self.map!{|z| z.reverse!}
end;	

def flip
	s=self.map{|z|z.first}.max
	self.map!{|z| [s-z.first,z.last]}
end;

def flop
	s=self.map{|z|z.last}.max
	self.map!{|z| [z.first,s-z.last]}
end;

def rotate
	sx=self.map{|z|z.first}.max
	sy=self.map{|z|z.last}.max
	self.map!{|z| [sy-z.last,z.first]}
end;	
end;
puts x.trans.to_s

xx=[[0,1],[10,1],[1,1]]
puts xx.to_s
puts xx.flip.to_s
puts xx.flop.to_s

shape=[[0,1],[1,0],[1,1],[2,1]]
puts shape.to_s
puts "1. #{shape.rotate.to_s}"
puts "2. #{shape.rotate.to_s}"
puts "3. #{shape.rotate.to_s}"
puts "4. #{shape.rotate.to_s}"

puts Time.now.year
puts File.join("c:","koko")
File.write("a.txt","qqq")