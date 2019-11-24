class C1
	attr_accessor :array
	class C2
		attr_accessor :val, :idx	
		def initialize(i)
			@val=i;			
		end;
	end;

	def initialize
		@array=[]
		@newIdx=0;
	end;	
	
	def add(i)
		a=C2.new(i)
		a.idx=@newIdx
		@array<<a
		@newIdx+=1
	end;

	def get(i)
		@array.each do |item|
			puts item.inspect
			return item.val if item.idx==i
		end;
	end;
end;

q=C1.new
q.add(100);
q.add(200);

#puts q.inspect
#puts q.get(0)
puts q.get(1)
