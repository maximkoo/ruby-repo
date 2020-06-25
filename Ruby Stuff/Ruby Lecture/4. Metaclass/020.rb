#Но в Руби есть возможность определить метод для отдельного экземпляра класса, в данном случае

# def d2.m3
#      puts :m3
# end

#для этого заведен специальный метод

# puts d2.singleton_class #=> #<Class:#<C1:0x1b076c8>>
# puts d2.singleton_class.name #=> пусто

#В контекст метакласса объекта d2 можно перейти так:

# class<<d2
#      puts self
# end;

# если мы уже находимся в контексте объекта d2, то

# class<<self
#      puts self
# end;

# Если надо перейти из контекста объекта d2 в контекст класса С1, то пишем

# class<<d2.class
#      puts self
# end;

# или ещё проще

# class<<С1
#      puts self
# end;
