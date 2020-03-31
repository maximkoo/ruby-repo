a=[3,2,7,9,1,5,4,8,6]
#a=[1,2,3,7,4,5,6,8,9]
#a=[2,1]
#a=[2,1,3,4]

class Array
	def sortMerge
		combine(splitted);
	end;	

	def splitted
		arr=[] # array of rows, each row is an array and contains more arrays
		newRow=[]
		newRow<<self;
		arr<<newRow
		i=0;
		s=self.size;
		while s>1
			#s=s.fdiv(2).ceil
		 	#puts "s=#{s}"
		 	newItem=[]
		  	row=arr.last
			#puts "row size is #{row.size}"
			row.each do |item|
				#puts "item size is #{item.size}"
				#s=item.size.fdiv(2).ceil
				s=item.size/2
				#puts "s=#{s}"
				if item.size!=3 # Three is a special value
					newItem<<item[0..s-1]
		 			newItem<<item[s, item.size-1]
		 		elsif item.size==3
		 			(0..2).each {|q| newItem<<[item[q]]}
		 			#newItem<<[item[0]]
		 			#aaa<<[item[1]]
		 			#aaa<<[item[2]]
		 		end;	
			end;	
		 	arr<<newItem 	
		 	i+=1 	 	
		 	#puts arr.to_s
		 end;
		 arr	
	end; 

	private
	def merge(a1, a2)
		merged=[]
		(a1.size+a2.size).times do
			case when a1.first.nil? 
					a=a2;
				when a2.first.nil? 
					a=a1 
				else	
					a1.first<a2.first ? a=a1 : a=a2
			end;				
			merged<<a.shift
			#puts "a1 wins: #{merged.last}"if a==a1 
			# puts "a2 wins: #{merged.last} "if a==a2 
			#puts merged.last
		end;
		merged
	end;	
	puts "---"
	#puts merge(b1,b2).to_s
	#puts merge([2],[2]).to_s

	def combine(arr) # splitted array
		p=arr.last.size.fdiv(2).ceil
	 	i=arr.size
	 	i.times do  	 		
	 		#row=arr.last # Так нельзя, мы получаем не копию значения arr.last, а ссылку на него, и потом из него делается shift, отчего пропадают значения
	 		row=Marshal.load(Marshal.dump(arr.last))
	 		#puts "p=#{p}"
	 		newRow=[]
	 		(0..p-1).each do |j|
	 			#puts "j*2=#{j*2}, r1=#{row[j*2]}, r2=#{row[j*2+1]}"
	 			if row[j*2+1].nil?
	 				newItem=row[j*2]
	 			else	
	 				newItem=merge(row[j*2],row[j*2+1]);
	 			end;	
	 			#puts "newItem=#{newItem.to_s}"
	 			newRow<<newItem
	 		end;	
	 		#puts "newRow=#{newRow.to_s}"
	 		arr<<newRow;
	 		p=newRow.size.fdiv(2).ceil
		end;	
		return arr.last.last;
	end;
end;
puts a.to_s
puts a.sortMerge.to_s