class Service
	def Service.set_data_methods(obj,data)
		data.each do |k,v|
			puts "#{k.to_sym} #{v}"
			obj.class.class_eval do
				define_method("#{k.to_s}") do
					instance_variable_get("@#{k.to_s}");
				end;

				define_method("#{k.to_s}=") do |x|
					instance_variable_set("@#{k.to_s}", x)	
				end;
			end;
			obj.send("#{k.to_sym}=",v)
		end;
	end;
end;