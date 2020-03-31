b=Proc.new{|x|puts x};
b.call(1);
# То же самое можно записать, как 
b=lambda{|x|puts x};
b.call(1);
# Или с помощью ->
b=->(x) {puts x};
b.call(1)