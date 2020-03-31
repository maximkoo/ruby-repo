class ArrayList
	attr_accessor :aMax;
	class Item
		attr_accessor :idx,:value
		def initialize(idx, value)
			@idx,@value=idx,value
		end;
	end;

	def initialize
		@array=[]
		@aMax=0
	end;
		
	def get(i)
		@array.each do |item|
			if item.idx==i
				return item.value;
			end;	
		end;	
	end;

	def add(x)
		@array<<Item.new(@aMax,x)		
		@aMax+=1;
	end;

	def remove(i)
		@array.delete_at(i)
		@array.each do |item|
			item.idx=item.idx-1 if item.idx>i
		end;	
	end;

	def length
		@array.size
	end;	
end;

class LinkedList
	attr_accessor :head;
	def initialize
		#@aPrev=nil;
		@head=nil;
	end;	

	class Item
		attr_accessor :nxt,:value
		def initialize(x)
			@value=x
		end;
	end;
		
	def get(i)
		z=@head;
		i.times do 
			z=z.nxt;
		end;	
		z.value;
	end;

	def add(x)		
		a=Item.new(x)
		if @head.nil? 
			@head=a;
			return;
		end;	
		z=@head;
		loop do 	
			if z.nxt.nil?
				z.nxt=a;
				break;
			else
				z=z.nxt;				
			end;
		end
	end;

	def remove(i)
		if i==0 
			@head=@head.nxt;
			return
		end;	
		z=@head; z1=z;
		i.times do
			z1=z;
			z=z.nxt;
		end;	
		z1.nxt=z.nxt;
	end;

	def length
		s=0;
		z=@head
		while !z.nil? do
			s+=1
			#puts s			
			z=z.nxt
		end
		s
	end;	
end;

# puts "--- ArrayList ---"
# q=ArrayList.new
# q.add(1)
# q.add(10)
# q.add(100)
# q.add(1000)

# # puts "Length=#{q.length}"
# # puts q.get(0)
# # puts q.get(1)
# # puts q.get(2)
# # puts q.get(3)

#  q.remove(2)
#  q.remove(0)
#  # (0..1).each do |i|
#  # 	puts q.get(i)
#  # end;	

# puts "--- LinkedList ---"
# qq=LinkedList.new
# qq.add(11)
# qq.add(101)
# qq.add(1001)
# qq.add(10001)

# #puts qq.inspect
# # puts "Length=#{qq.length}"
# # puts qq.get(0)
# # puts qq.get(1)
# # puts qq.get(2)
# # puts qq.get(3)

# qq.remove(2)
# qq.remove(0)

# class ListTester
# 	def testList(list)	
# 		puts "---"
# 		puts "list.class=#{list.class.name}"
# 		puts "list.length=#{list.length}"
# 		(0..list.length-1).each do |i|
#  			puts list.get(i)
#  		 end;	
# 	end;
# end;		

# puts "--- ListTester ---"
# lt=ListTester.new
# lt.testList(q)
# lt.testList(qq)
	


