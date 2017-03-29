require 'open-uri' 
# используем openURI вместо обычного в таких случаях net/http
addr="http://localhost:3000/show"
open("file_to_write.txt", "wb") do |file| 
	open(addr) do |uri| 
		file.write(uri.read) 
		end 
	end
#в данном случае вызываемая страница приложения twoways рендерит XML с данными из таблицы STREET
# полученный XML записываем в файл
