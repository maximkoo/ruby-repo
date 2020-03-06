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

class C2<C1

end;

puts C2.a #=> пусто