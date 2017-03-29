require 'bigdecimal'
a=1.2
b=1.0
c=0.2
if a-b==c then puts "TRUE" else puts "FALSE" end
if BigDecimal.new(a.to_s)-BigDecimal.new(b.to_s)==BigDecimal.new(c.to_s) then puts "TRUE" else puts "FALSE" end

puts a=0
puts b=-0.2
puts c=0.2
puts "a/b=#{a/b}"
puts "a/c=#{a/c}"
if a/b==a/c then puts "TRUE" else puts "FALSE" end
