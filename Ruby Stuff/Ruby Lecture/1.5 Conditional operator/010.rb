a=0
if a==0 #многострочный вариант, then не нужен
     a=1
     puts a
end;


if a==1 then a=2; end; # однострочный вариант, с then
puts a


a=3 if a==2 #<-- if в в конце строки
puts a


unless a==100500 then a=4 end; # unless  в начале
a=4 unless a==100500 # unless в конце
puts a


b=99

b==100 and a=5 #<-- AND
puts a

b==100 or a=5 #<-- OR
puts a
