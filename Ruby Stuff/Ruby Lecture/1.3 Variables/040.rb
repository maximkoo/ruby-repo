class C1
     attr_reader "a"
     attr_writer "a"
     def initialize
          @a=1
     end;    
end;

c=C1.new
puts c.a
c.a=2
puts c.a