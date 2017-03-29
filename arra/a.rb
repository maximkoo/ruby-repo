arr=[1,2,3]
if arr.include?(2) then 
	puts 'OLOLO'
else
 	puts 'Trololo'	
end 	
puts arr.fetch(2) { |key| key+1 }