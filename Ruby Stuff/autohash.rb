# Предположим, что у нас есть хэш-массив, который мы передаем в некий класс для инициализации объекта
# все ключи у него - строки или символы
d=Hash["x"=>100, "y"=>200, "s"=>"Kokoko", "a"=>[1,2,3]]
# Было бы удобно, если бы на каждый элемент были бы созданы методы для чтения и изменения
class C1
	def C1.set_methods_by_hash(obj,data)
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

# вот класс, который получает на вход хэш-массив
class C2
	def initialize(data)
		C1.set_methods_by_hash(self, data)
	end;
end;	

c1=C1.new
c2=C2.new(d)
puts "---"
#puts c2.methods
puts "---"
puts "c2.x=#{c2.x}"
puts "c2.a=#{c2.a.to_s}"