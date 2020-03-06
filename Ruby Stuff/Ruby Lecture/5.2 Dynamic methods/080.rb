module M1
     def onTheFly
          instance_variables.each do |x|
               define_singleton_method("#{x.to_s.gsub('@','')}=") do |z|
                    instance_variable_set(x,z);
               end;    
               define_singleton_method("#{x.to_s.gsub('@','')}") do
                    instance_variable_get(x)
               end;    
          end
     end;    
end;

class C1
include M1
     def initialize
          @a=@b=@c=0
          @total_amount=1.5
          @top_rated=100          
          @secret_password="12345"
          @many_values=[1,2,3,4,5]
          @current_date=Time.now  

          onTheFly;#=> Создаем методы для всех переменных при создании объекта       
     end;
end;         

d=C1.new
puts d.methods # видно, что появились методы доступа

puts "-------------------------"
d.a=150 #=> setter-метод
puts d.a #=> getter-метод
