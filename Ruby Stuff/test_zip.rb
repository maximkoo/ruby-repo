a=[1,2,3]
b=[10,20,30]
c=[100,200,300]
a.zip(b).zip(c).each do |x,y|
puts x.to_s
puts y.to_s
#puts z.to_s
end;

puts ([5]*4).to_s

puts "---"

