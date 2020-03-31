class C3
     class<<self
     define_method (:m2) do |p1,p2|
          puts "#{p1} #{p2}"
     end;    
end;
end;

C3.m2(1,2)
