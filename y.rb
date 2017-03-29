def m1
 a=0
 a=a+1
 puts "a=#{a}"
 yield
end 

m1 do
 b=0
 puts "b=#{b}"
end 

puts "2. ----------"

def m2
a=0
 a=a+1
 puts "a=#{a}"
 if block_given? 
 yield
 else 
 puts "no block given"
 end 
end 

m2 do
 b=0
 puts "b=#{b}"
end 

m2

puts "3. ----------"

def m3(x)
if block_given?
	yield(x) 
else 
	puts "no block given"
end
end;

m3(5) do |i|
  i=i+1
  puts i
end

puts "4. ----------"

def m4(arr)
 a=0
 a=a+1
 puts "a=#{a}"
 if block_given? 
 arr.each do |i|
	yield(i)
 end	
 else 
 puts "no block given"
 end 
end 

b=[0,1,2]
m4(b) do |i|
 i=i+1
 puts i
end
