class C1
     @@b=200;
     def b=(x)
          @@b=x
     end;    

     def b
          @@b
     end;    
end;

a1=C1.new
puts a1.b #=>200
a2=C1.new
a1.b=300
puts a2.b #=>300