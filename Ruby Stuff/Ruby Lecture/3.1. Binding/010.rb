def m1
    yield #=>100
end;

a=100
m1 do 
     puts a
end  
