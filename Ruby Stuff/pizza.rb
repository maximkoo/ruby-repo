s="I need to round up a floating point number to the nearest integer."
words=s.split.size
puts words
x=words.fdiv(2).ceil
puts x
a=s.split.each_slice(x).map{|a| a.join(' ')} 
puts a