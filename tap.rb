class C1
	attr_accessor :a1
	def initialize
		yield(self)
	end;
end;

x=C1.new do |c|
	c.a1=1
end;	

puts x.a1 #=> 1

class C2
	attr_accessor :a2
end;

x=C2.new do |c|
	c.a2=1
end;

puts x.a2 #=> пусто, потому что экземпляр класса С2 не принимает блок

x=C2.new.tap do |c| # а с методом tap он уже как будто бы принимает блок
	c.a2=2
end;	

puts x.a2 
