	print "0. "
	puts self
	class C1
	 	print "1. "
	 	puts self
	 	def m1
	 		print "2. "
	 		puts self
	 	end;
	 
	 	def C1.m2
	 		print "3. "
	 		puts self
	 	end;
	 
	 	class<<self
	 		print "4. "
	 		puts self;
	 		def m3
	 			print "5. "
	 			puts self
	 		end;	
	 	end;	

	 	def m4
	 		class<<self
	 			print "6. "
	 			puts self
	 		end;	
	 	end;	

	  	def initialize 
	  		print "7. "
	  		puts self
	  	end;	
	 	print "8. "
	 	puts self
	 end;
	 print "9. "
	 puts self


c=C1.new
c.m1;
c.m4
C1.m2
C1.m3
