class C1
	def m1(&b)
		a=5
		if block_given?
			b.call(a)
		else
			yield(a)
		end;
	end;
end;

c=C1.new
c.m1 do 
	puts 123
end;
