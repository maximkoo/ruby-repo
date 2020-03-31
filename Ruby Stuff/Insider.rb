class Insider
	attr_accessor :poly
	def initialize
		@poly=[]
		@poly<<{x:100,y:100} #0
		@poly<<{x:150,y:150} #1
		@poly<<{x:100,y:200} #2
		@poly<<{x:10, y:160};
		@poly<<{x:50,y:150} #3
		@poly<<@poly.first.clone #4
	end;

	def isInside?(p)
		vs=[]
		@poly.each_with_index do |q1,idx|
			break if idx==@poly.size-1
			q2=@poly[idx+1]
			print q1, q2, "\n"
			dx=q2[:x]-q1[:x]
			dy=q2[:y]-q1[:y]
			#v1=Math.sqrt(dx*dx+dy*dy)
			print "#{dx}, #{dy} \n"

			dpx=p[:x]-q1[:x]
			dpy=p[:y]-q1[:y]
			print "#{dpx}, #{dpy}, \n"
			#Math.sqrt(dpx*dpx+dpy*dpy)			
			vs << 0.5*(dx*dpy-dpx*dy);
			puts vs
			puts 
		end
		return vs.count{|c| c >= 0}==vs.size;
	end;	
end;

class Point
	attr_accessor :x,:y, :poi
	def initialize(x,y)
		@x=x, @y=y
		@poi={x:x, y:y}
	end;
end;	

polygon=Insider.new
p=Point.new(50,50)
puts polygon.isInside?(p.poi)
p=Point.new(100,150)
puts polygon.isInside?(p.poi)