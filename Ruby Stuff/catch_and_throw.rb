require 'json'
puts 1
catch (:some_stuff) do
	puts 2
	throw (:some_stuff) # throw - это не перехват исключения, а вроде оператора goto. Он переводит выполнение на конец блока, имя которого указано
	# То есть throw - просто молчаливый выход из текущего блока, также как break - выход из цикла
	puts 3
end;
puts 4
# получается 1 2 4

puts "---"

# Не знаю, насколько осмыслен этот пример. 
# Предположим, мы открываем последовательно несколько файлов
# как только при открытии происходит ошибка разбора, бросаем все последующие файлы и выходим молча
catch (:parser) do
	begin
		x1=JSON.parse(File.read("./1.json"));
	rescue JSON::ParserError
		throw(:parser)
	ensure
		puts "First file done"
	end;

	begin
		x2=JSON.parse(File.read("./autohash.rb"));
	rescue JSON::ParserError
		throw(:parser)
	ensure
		puts "Second file done"
	end;

	begin
		x3=JSON.parse(File.read("./meth.rb"));
	rescue JSON::ParserError
		throw(:parser)
	ensure
		puts "Third file done"
	end;
end
