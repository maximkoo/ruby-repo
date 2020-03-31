def m4(a1, a2, a3, &b) #--<--- &b - блок среди параметров
    puts a1
    yield a3 #=> Block executed
    b.call a3 #=> Block executed
    puts a2
end;

m4(1,2, 'executed with parameter') do |x|
   puts "Block #{x}"
end;

#хоть блок и упомянут в сигнатуре метода, но аргументом все равно не считается

#puts "arity=#{method("m4").arity}"; # =>3
