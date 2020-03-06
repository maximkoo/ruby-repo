class C1
	def method_missing(*args)
		puts "You have called method named \"#{args[0]}\" with params #{args[1..-1]}"
	end;
end;	

C1.new.ttt(100,200,300)

class C2
	def method_missing(*args)
		if args.first=~ /(.*)=/
			varName=args.first.to_s.gsub("=","");
			instance_variable_set("@#{varName}", args[1])
		elsif instance_variables.include?("@#{args.first}".to_sym)
			instance_variable_get("@#{args.first}".to_sym)			
		else 
			puts "Incorrect call"
			super
		end
	end;
end;	

d=C2.new
d.a=2
puts d.a
#d.ttt
