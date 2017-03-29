require 'open-uri' 
#автоматически добавляем несколько улиц в таблицу STREET через приложение twoways
addr="http://localhost:3000/external?p_name="
	(10..15).each do |i|
	open(addr+'street_'+i.to_s) do |uri| 
		puts addr+'street_'+i.to_s
		end 
	end

	#res=open(addr+'xxx1');
	#puts res;