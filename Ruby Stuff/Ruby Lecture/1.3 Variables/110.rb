$a=0
class C1
     $a=1    
     def m1
          $a=2
     end;    
end;

C1.new.m1

class C2
     puts $a
end;