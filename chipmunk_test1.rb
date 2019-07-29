require 'chipmunk'
shape_array = [CP::Vec2.new(-25.0, -25.0), 
	           CP::Vec2.new(-25.0, 25.0), 
	           CP::Vec2.new(25.0, 1.0), 
	           CP::Vec2.new(25.0, -1.0)]

big=[1,2,3,4,5,6,7,8,9,10]
small=[9,10,11,12]
small=(small-big)
puts small.to_s
big=big+small
puts big.to_s

