require 'gosu'
module GosuGeom
class Point
		attr_accessor :x,:y
		def initialize(x,y)
			@x,@y=x,y
		end;
	
		def to_s
			"x=#{@x}, y=#{@y}" 
		end	
	end;

	class Segment
		attr_reader :p1,:p2
		def initialize(p1,p2)
			@p1,@p2=p1,p2
		end;

		def to_s
			"p1=#{p1.x},#{p1.y}, p2=#{p2.x},#{p2.y}"
		end;	
	end;	

	class Ray<Segment
		attr_reader :p1,:p2
		def initialize(p0,p,l=1000)
			@p0,@p=p0,p
			@p1=p0;
			dx=p.x-p0.x
			dy=p.y-p0.y
			l0=Gosu.distance(p0.x,p0.y,p.x,p.y)
			px=dx*(l.fdiv l0)
			py=dy*(l.fdiv l0)
			@p2=Point.new(p0.x+px,p0.y+py)
		end;
	end;

	class RayAtAngle
		def initialize(p0,ang0,ang1,l=1000)

		end;
	end;	

	def GosuGeom.sgn(n)
    	n <=> 0
  	end

	def GosuGeom.intersection(s1,s2)
		dx1=s1.p2.x-s1.p1.x
		dx2=s2.p2.x-s1.p1.x
		dx3=s2.p1.x-s1.p1.x

		dy1=s1.p2.y-s1.p1.y
		dy2=s2.p2.y-s1.p1.y
		dy3=s2.p1.y-s1.p1.y

		ds1=dx2*dy1-dx1*dy2
		ds2=dx3*dy1-dx1*dy3

		return nil if sgn(ds1)==sgn(ds2)

		dx1=s2.p2.x-s2.p1.x
		dx2=s1.p2.x-s2.p1.x
		dx3=s1.p1.x-s2.p1.x

		dy1=s2.p2.y-s2.p1.y
		dy2=s1.p2.y-s2.p1.y
		dy3=s1.p1.y-s2.p1.y

		ds1=dx2*dy1-dx1*dy2
		ds2=dx3*dy1-dx1*dy3

		return nil if sgn(ds1)==sgn(ds2)

		return s1.p2 if ds1==0 
		return s1.p1 if ds2==0

		rx=s1.p1.x+(s1.p2.x-s1.p1.x)*(ds2.fdiv(ds1.abs+ds2.abs).abs);

		return s2.last if ds1==0 
		return s2.first if ds2==0

		ry=s2.p1.y+(s2.p2.y-s2.p1.y)*(ds2.fdiv(ds1.abs+ds2.abs).abs);

		return Point.new(rx,ry)
	end;

	def GosuGeom.intersection_box(p0,p1, box_width,box_height)
		if p1.y<p0.y && p0.x==p1.x then return GosuGeom::Point.new(p0.x,0);end;
		if p1.y>=p0.y && p0.x==p1.x then return GosuGeom::Point.new(p0.x,box_height);end;
		if p1.x<p0.x && p0.y==p1.y then	return GosuGeom::Point.new(0,p0.y);end;
		if p1.x>=p0.x && p0.y==p1.y then return GosuGeom::Point.new(0,box_width); end;
		a=GosuGeom.angle_point(p0,p1)
		puts a
		arad=Math::PI*a.fdiv(180)
		puts "arad=#{arad}"
		#tga=Math.tan(arad);
		tga=(p1.y-p0.y).fdiv(p1.x-p0.x)
		puts "tga=#{tga}"
		ap1=Gosu.angle(p0.x,p0.y, 0,0)
		ap2=Gosu.angle(p0.x,p0.y, box_width,0)
		#puts [a, ap1, ap2].to_s
		if GosuGeom.angle_between?(a,ap1,ap2)
			puts "1st angle equation"
			#puts p0.x+p0.y.fdiv(tga)
			return GosuGeom::Point.new(p0.x-p0.y.fdiv(tga),0)
		end;
		ap3=Gosu.angle(p0.x,p0.y, box_width,box_height)
		if GosuGeom.angle_between?(a,ap2,ap3)
			puts "2nd angle equation"			
			return GosuGeom::Point.new(box_width, p0.y+(box_width-p0.x)*tga)
		end;
		ap4=Gosu.angle(p0.x,p0.y, 0,box_height)
		if GosuGeom.angle_between?(a,ap3,ap4)
			puts "3rd angle equation"			
			return GosuGeom::Point.new(p0.x+(box_height-p0.y).fdiv(tga),box_height)
		end;
		if GosuGeom.angle_between?(a,ap4,ap1)
			puts "4th angle equation"			
			return GosuGeom::Point.new(0, p0.y-p0.x*tga)
		end;
	end;	

	def GosuGeom.angle_point(p1,p2)
		Gosu.angle(p1.x, p1.y, p2.x, p2.y)
	end;	

	def GosuGeom.angle_between?(ap,a1,a2)
		if (a1-a2).abs>180
		 	a1-=360 if a1>180
		 	a2-=360 if a2>180
		end;	
		a1,a2=a2,a1 if a1>a2
		return ap.between?(a1,a2)
	end;

	def GosuGeom.point_in_angle?(p0, p1, a1,a2)
		GosuGeom.angle_between?(GosuGeom.angle_point(p0,p1),a1,a2);
	end;

	def GosuGeom.point_in_view?(p0, p1, a0, a1) # p0 - viewpoint, p1 - explored point, a0 - default direction, a1 - left right scope
		#GosuGeom.angle_between?(Gosu.angle_point(p0,p1),a1,a2);
		ap=GosuGeom.angle_point(p0,p1)
		puts "Actual angle between the points is #{ap.round(3)}, initial direction is #{a0}, scope is #{a0-a1/2}...#{a0+a1/2}"
		GosuGeom.angle_between?(ap,a0-a1/2, a0+a1/2)
	end;	

	def GosuGeom.distance_point(p1,p2)
		Gosu.distance(p1.x,p1.y,p2.x,p2.y)
	end;	
end;

p1=GosuGeom::Point.new(50,100);
p2=GosuGeom::Point.new(150,100);
p3=GosuGeom::Point.new(50,100);
p4=GosuGeom::Point.new(50,150);

s1=GosuGeom::Segment.new(p1,p2)
s2=GosuGeom::Segment.new(p3,p4)

res=GosuGeom.intersection(s1,s2)
puts res.to_s;

r=GosuGeom::Ray.new(p1,p2)
r=GosuGeom::Ray.new(p3,p4)
r=GosuGeom::Ray.new(p4,p3)
r=GosuGeom::Ray.new(p2,p4)

puts "---"

p10=GosuGeom::Point.new(100,100);
p11=GosuGeom::Point.new(200,99);
r=GosuGeom::Ray.new(p10,p11)

puts r.to_s

sf=GosuGeom::Segment.new(GosuGeom::Point.new(500,0),GosuGeom::Point.new(500,300));
puts GosuGeom.intersection(r,sf)
puts "``````"

ps=GosuGeom::Point.new(100,100);
ps0=GosuGeom::Point.new(40,200);

#ray_left=GosuGeom.Ray(ps0,)
puts GosuGeom.point_in_angle?(ps0,ps,-30,30);
puts GosuGeom.point_in_view?(ps0,ps,10,60);

puts "--------"
p0=GosuGeom::Point.new(100,100);
p1=GosuGeom::Point.new(90,90);
pp=GosuGeom.intersection_box(p0,p1,500,500)
puts pp.to_s