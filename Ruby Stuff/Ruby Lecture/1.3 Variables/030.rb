сlass C1
     def initialize
          @a=1
     end;

     def a=(x)
          @a=x
     end;
    
     def a
          @a
     end
end;

c=C1.new
puts c.a
c.a=2
puts c.a