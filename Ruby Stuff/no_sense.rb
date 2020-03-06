require 'thread'
t=Thread.new do
	Thread.stop	
	puts "OLOLO"
end
#t.run

# t=Thread.new do |x|
# 	x.stop	
# 	puts "OLOLO"
# end
while !t.stop? do
end;
t.run

class Stuff
	def initialize	
		@b=Hash.new
		#@b=[]
		5.times do |tx|
			t=Thread.new do 
				Thread.stop
				5.times do |x|
					puts "Thread number #{tx} value=#{x}"
				end
			end;
			#@b<<t
			@b[tx]=t
		end
		puts @b
	end;

	def m1
		 5.times do |i|
		 	@b[i].run;			
		 end;	
		#Thread.list.each do |t|
	    #	t.run			
		#end;	
	end;	
end

Stuff.new.m1
sleep 4


