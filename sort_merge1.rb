#a1=[3,2,7,9]
#a2=[1,5,4,8,6]
a1=[2,3,7,9]
a2=[1,4,5,6,8]

(a1.size+a2.size).times do
	case when a1.first.nil? 
			a=a2;
		when a2.first.nil? 
			a=a1 
		else	
			a1.first<a2.first ? a=a1 : a=a2
	end;		
	#puts "a1 wins "if a==a1 
	#puts "a2 wins "if a==a2 
	puts a.shift
end;