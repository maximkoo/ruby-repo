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
