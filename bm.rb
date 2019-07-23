require 'benchmark' # стандартный гем, ставить не надо

puts (Benchmark.measure do # измеряем блок
	(0..1000000).each do |i|
		a="abc"; # на каждом проходе создается объект-строка
	end;
end);

puts (Benchmark.measure do
	(0..1000000).each do |i|
		a=:abc; # на каждом проходе используем один и тот же символ, экономия около 50% !
	end;
end);

puts "-----------" # То же самое через метод #bm

Benchmark.bm do |x|
	x.report do
		(0..1000000).each do |i|
			a="abc"; # на каждом проходе используем один и тот же символ
		end;
	end;
	x.report do
		(0..1000000).each do |i|
			a=:abc; # на каждом проходе используем один и тот же символ
		end;
	end;	
end;	