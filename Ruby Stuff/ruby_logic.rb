class Fixnum
	def >(x)
		self.to_s>x
	end;		
end;	
puts 3>'three' # false
puts '3'>'three' # Действительно false