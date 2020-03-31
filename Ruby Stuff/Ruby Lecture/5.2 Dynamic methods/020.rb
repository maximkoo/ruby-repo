class C3
     define_method (:m1) do |p1,p2|
          puts "#{p1} #{p2}"
     end;    
end;

C3.new.m1(1,2)
