class C1
	def m1
		b=binding
		yield(b)
		puts b.local_variable_get(:a)
	end;

end;

a=100
C1.new.m1 do |x|
	x=binding
end;