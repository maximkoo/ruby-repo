a=[1,2,3]
a.each do |i|
	a<<4 if i==2
	puts i
end;

puts

a1=[1,2,3,4,5,6];
a=a1.each
begin
puts a.next
puts a.next
puts a.next
puts a.next
puts a.next
a1<<10
puts a.next
puts a.next
puts a.next
rescue StopIteration
	puts "Over"
end

puts
puts :sss.to_s=='sss'

