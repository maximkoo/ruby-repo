class C1
    attr_accessor "a"
    @a=1

    def C1.a=(x)
         @a=x
    end;
   
    def C1.a
         @a
    end;         
end;

puts C1.a
C1.a=2
puts C1.a