class C1
	def method_missing(*args)
		self.class.class_eval do
			if args.first=~ /(.*)=/
				define_method("#{args.first}") do
					#puts %Q{Method named "#{args.first}" is run}
					puts %Q{Variable named "#{$1}" is set to #{args[1]}}
					instance_variable_set("@#{$1}", args[1])
				end;	
			else
				define_method("#{args.first}") do
					puts %Q{Variable named "#{args.first}" is equal to }+instance_variable_get("@#{args.first}").to_s
					instance_variable_get("@#{args.first}")
				end;	
			end
		end
	self.send(args.first)
	end;	
end;

a=C1.new;

a.trololo=5
puts a.trololo

puts "-- Instance methods of C1 --"
puts C1.instance_methods.grep /ololo/ #=> trololo=, trololo
puts a.instance_variables.grep /ololo/ #=> @trololo

a.kokoko=100
puts a.kokoko
