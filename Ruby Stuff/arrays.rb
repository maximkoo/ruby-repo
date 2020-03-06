a=[1,3,5,7,9]
b=[2,4,6,8,10]

print "Zip: "
arr=a.zip b
puts arr.to_s

print "Flatten: "
puts arr.flatten!.to_s


arr2=arr.map{|x| x+1}
print "Map: "
puts arr2.to_s

print "Shuffle: "
arr.shuffle!
puts arr.to_s

print "Sort: "
arr.sort!
puts arr.to_s

print "Select: "
arr.select!{|x| x>5}
puts arr.to_s

print "Multiply: "
arr=arr*2
puts arr.to_s

puts "Sum within groups of three"
arr.each_slice(3) do |x|
	s=x.reduce(0) {|sum, n| sum+n}
	puts s 
end