class C1
     eval "puts 1"
end;

#А если вызвать метод eval, как метод класса?
#C1.eval("puts 1") #=> ошибка

# Чтобы запустить код в контексте класса извне, существует метод class_eval
#C1.class_eval("puts 1")

#для наглядности, что мы действительно в контексте класса
#C1.class_eval("puts self")

# в контексте экземпляра класса
#C1.new.instance_eval("puts self")
