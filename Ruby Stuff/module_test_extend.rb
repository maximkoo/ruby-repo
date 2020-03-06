module M1
	def mm1
		puts :mm1
	end;
end;

class C1
	class<<self
		include M1
	end;
end;		

C1.mm1	