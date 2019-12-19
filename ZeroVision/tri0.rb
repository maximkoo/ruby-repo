require 'gosu'

module Gosu
	class Point
		attr_accessor :x,:y
		def initialize(x,y)
			@x,@y=x,y
		end;
	end;

	class Segment
		attr_reader :p1,:p2
		def initialize(p1,p2)
			@p1,@p2=p1,p2
		end;	
	end;	

	def Gosu.angle_point(p1,p2)
		Gosu.angle(p1.x, p1.y, p2.x, p2.y)
	end;	

	def Gosu.angle_between?(a0,a1,a2)
		 if (a1-a2).abs>180
		 	a1-=360 if a1>180
		 	a2-=360 if a2>180
		end;	
		a1,a2=a2,a1 if a1>a2
		return a0.between?(a1,a2)
	end;

	def Gosu.point_in_angle?(p0, p1, a1,a2)
		Gosu.angle_between?(Gosu.angle_point(p0,p1),a1,a2);
	end;	

	def Gosu.distance_point(p1,p2)
		Gosu.distance(p1.x,p1.y,p2.x,p2.y)
	end;	
end;	

p0=Gosu::Point.new(100,100);

p1=Gosu::Point.new(110,50)
p2=Gosu::Point.new(90,50)

q1=Gosu::Point.new(100,50)

a01=Gosu.angle(p0.x, p0.y, p1.x, p1.y)
a02=Gosu.angle(p0.x, p0.y, p2.x, p2.y)
puts a01,a02
a0102=Gosu.angle_diff(a01,a02)
puts a0102

# if a0102<0
# 	a01-=360 if a01>180
# 	a02-=360 if a02>180
#end;	
#puts "---recalc"

#puts a01,a02
#a01,a02=a02,a01 if a01>a02
#puts "---swap"
#puts a01,a02

aq0=Gosu.angle_point(p0,q1)
puts aq0

got_it=Gosu.angle_between?(aq0, a01,a02)
if got_it
	puts "The distance is #{Gosu.distance_point(p0,q1)}"
end;	