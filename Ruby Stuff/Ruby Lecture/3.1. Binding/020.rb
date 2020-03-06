def m1
     a=200
     yield #=> ???
end;

a=100
m1 do
     puts a
end
