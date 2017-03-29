p=proc {puts 12345}
p.call
p=Proc.new{puts 99999}
p.call
#inp = $stdin.read --вводим сколько угодно, пока не нажмём CTRL-Z
#puts inp
inp=gets
case inp.strip! #по-видимому, надо отстричь перевод строки
when "1" then p=proc{puts 'OLOLOLOLO'} 
when "2" then p=proc{puts 'TROLOLOLO'}
else p=proc{puts "OTHER"}
end;
p.call
