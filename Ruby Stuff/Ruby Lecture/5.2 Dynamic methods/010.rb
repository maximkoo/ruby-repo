class C1
     eval "def m1
               puts 1
          end"
end;

C1.new.m1

# То же самое мы можем сделать с помощью метода class_eval

# C1.class_eval("def m2 \n puts :m2 \n end")    
# C1.new.m2

# или же то же самое, используя блок вместо строки

# C1.class_eval do
#      def m2
#           puts :m2
#      end
# end;
    
# C1.new.m2

# А что, если мы вместо class_eval используем instance_eval?

# C1.instance_eval do
#      def m3
#           puts self
#      end;    
# end

# C1.m3 #=> Метод вызывается, как метод класса
