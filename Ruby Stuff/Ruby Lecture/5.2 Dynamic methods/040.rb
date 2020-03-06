class C1
     def initialize
          class<<self
               define_method :m1 do
                    puts :m1
               end
          end;    
     end;
end;

C1.new.m1 #=>m1
