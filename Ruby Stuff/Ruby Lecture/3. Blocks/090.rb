def m0
     puts "Method m0 executed"
end;     

# И метод, принимающий явный блок

def m7(&param1)
     puts param1.class.name
     param1.call
     yield
end; 

# Создадим объект-ссылку на метод:

method_ref=method(:m0)

# И передаем ссылку на метод в метод, принимающий блок

m7(&method_ref)
