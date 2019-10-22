a=[1,2,3].each do |i|
 	i
end.join(",")
puts a

a1=[1,1,2,2,3,3,4,4]
a2=a1.each_slice(2).to_a
puts a2.to_s

x=1
x=x+['1','2','3'].each do |i|
	i
end.join("").to_i;
puts x

# i=0
# x=while i<5 do 
# 	i+=1
# 	i
# end.join(",");	

# puts x
	
puts [1,1,2,2].to_s
puts ([1,2,3,4,5]<<[6,7]).to_s
aaa= "1,2,3".split(",")
puts [0,0,0]+aaa