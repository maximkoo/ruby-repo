# Тот же метод m7
def m7(&param1)
     puts param1.class.name
     param1.call
     yield
end;

class C2
     def to_proc
          Proc.new{puts "This is C2 class!"}
     end;    
end;

# И передадим экземпляр этого класса в наш метод m7

c=C2.new

m7(&c)
