# Передача параметров - по ссылке или по значению?

def change_string(str)
  str << " I can insult you all you want"
  str << " because you'll never see this"
  str << " because I'm going to replace the whole string!"
  str << " Haha you smell bad!"
  str = "What? I didn't say anything." # I'm so sneaky
end

be_nice_to_me = "hello"
change_string(be_nice_to_me)
puts be_nice_to_me #=> hello I can insult you all you want because you'll never see this because I'm going to replace the whole string! Haha you smell bad!
# то есть первые четыре строки изменяют один и тот же объект. На него указывает указатель be_nice_to_me, и под названием str этот же указатель передан в метод.
# но в пятой строке происходит присваивание, то есть создание нового объекта String и перевода указателя str на него.
# Это то же самое, что написать str=String.new("What? I didn't say anything.");
# и str начинает указывать на новый объект
# тогда как be_nice_to_me указывает на старый, с изменённым содержанием.

# То есть в Руби параметры передаются по значению, но сами эти значения - лишь  указатели и при вызове создается лишь копия указателя, но не самого объекта.

#То же самое проще
a="abc"
puts a.object_id #=> 23058984
a<<"d"
puts a.object_id #=> 23058984 Тот же самый объект, потому что строки в Руби mutable
a="qqq"
puts a.object_id #=> 23058900 # Но при переприсваивании все равно создается новый объект типа String и указатель "a" начинает указывать на него