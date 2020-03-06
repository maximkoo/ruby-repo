a=[3,2,7,9,1,5,4,8,6]
#a=[1,2,3,7,4,5,6,8,9]
#a=[2,1]
#a=[2,1,3,4]

class Array
	def sortMerge
		#puts self.each_slice(1).to_a.to_s
		combine(self.each_slice(1).to_a);
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

	def combine(arr1) # splitted array
		#p=arr.last.size.fdiv(2).ceil
		arr=[]
		arr<<arr1
		p=arr.last.size.fdiv(2).ceil
	 	#i=arr.size
	 	i=4
	 	i.times do  	 		
	 		#row=arr.last # Так нельзя, мы получаем не копию значения arr.last, а ссылку на него, и потом из него делается shift, отчего пропадают значения
	 		row=Marshal.load(Marshal.dump(arr.last))
	 		newRow=[]
	 		(0..p-1).each do |j|
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