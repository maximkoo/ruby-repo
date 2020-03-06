#a=[3,2,7,9,1,5,4,8,6]
a=[1,2,3,7,4,5,6,8,9]
#a=[2,1]
s=a.size

aa=[]

# while s>1
# 	s=s/2
# 	puts s
# end;	

s=a.size/2
puts "s=#{s}"
b1=a[0..s-1]
b2=a[s,a.size]
puts "b1=#{b1.to_s}"
puts "b2=#{b2.to_s}"

def merge(a1, a2)
	r=[]
	(a1.size+a2.size).times do
		case when a1.first.nil? 
				a=a2;
			when a2.first.nil? 
				a=a1 
			else	
				a1.first<a2.first ? a=a1 : a=a2
		end;				
		r<<a.shift
		 #puts "a1 wins: #{r.last}"if a==a1 
		# puts "a2 wins: #{r.last} "if a==a2 
		#puts r.last
	end;
	r
end;	
puts "---"
puts merge(b1,b2).to_s