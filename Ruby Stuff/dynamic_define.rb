class C1
	def method_missing(*args)
		self.class.class_eval do			
			if args.first=~ /(.*)=/
		 		puts "@#{args.first} is set to #{args[1]}"
		 		instance_variable_set("@#{$1}",args[1]);
			else
				instance_variable_get("@#{args.first}")	
			end		
		end;
	end;
end;

a=C1.new
a.trololo=5; 
puts a.trololo; #=> 5
a.trololo=20; 
puts a.trololo; #=> 20

puts C1.instance_variables #=> @trololo
