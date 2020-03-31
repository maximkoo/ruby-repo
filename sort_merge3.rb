a=[3,2,7,9,1,5,4,8,6]
#a=[1,2,3,7,4,5,6,8,9]
#a=[2,1]
#a=[2,1,3,4]
s=a.size
iterations=0

aa=[] # array of rows, each row is an array and contains more arrays
aa_row=[]
aa_row<<a;
aa<<aa_row
#puts aa.to_s;
s=a.size;

i=0;
while s>1
	
	s=s/2
 	puts "s=#{s}"
 	aaa=[]

  	row=aa.last
	#puts "row size is #{row.size}"
	row.each do |item|
		#puts "item size is #{item.size}"
		#s=item.size.fdiv(2).ceil
		#puts "s=#{s}"
		if item.size!=3
			aaa<<item[0..s-1]
 			aaa<<item[s, item.size-1]
 		elsif item.size==3
 			(0..2).each {|q| aaa<<[item[q]]}
 			#aaa<<[item[0]]
 			#aaa<<[item[1]]
 			#aaa<<[item[2]]
 		end;	
	end;	
 	aa<<aaa 	
 	i+=1 	 	
 	puts aa.to_s
 end;	

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
#puts merge(b1,b2).to_s
#puts merge([2],[2]).to_s

puts i;


p=aa.last.size.fdiv(2).ceil
 i.times do  	
 	row=aa.last
 	puts "p=#{p}"
 	newrow=[]
 	(0..p-1).each do |j|
 		puts "j*2=#{j*2}, r1=#{row[j*2]}, r2=#{row[j*2+1]}"
 		if row[j*2+1].nil?
 			r=row[j*2]
 		else	
 			r=merge(row[j*2],row[j*2+1]);
 		end;	
 		puts "r=#{r.to_s}"
 		newrow<<r
 	end;	
 	puts "newrow=#{newrow.to_s}"
 	aa<<newrow;
 	p=newrow.size.fdiv(2).ceil
 end;	

#puts aa.to_s