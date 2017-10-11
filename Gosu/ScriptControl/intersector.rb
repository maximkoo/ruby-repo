require 'gosu'
class Intersector<Gosu::Window
	POLYGON_LAYER=0
	attr_reader :p1,:p2
	def initialize
		super(600,600)

		# @p1=[{:x=>446.32356088112715, :y=>432.4983679885943},
		# 	{:x=>474.5143395047044, :y=>422.2377636888242}]	

		@p1=[{:x=>444, :y=>424},
			{:x=>501, :y=>400}]	


		@p2=[{:x=>466.5, :y=>410.0},
			{:x=>523.5, :y=>410.0},
			{:x=>548.5, :y=>447.0},
			{:x=>531.5, :y=>482.0},
			{:x=>511.5, :y=>478.0},
			{:x=>478.5, :y=>489.0},
			{:x=>451.5, :y=>459.0},
			{:x=>466.5, :y=>410.0}]	;

		rr=polygons_intersect?(@p1,@p2)
		puts rr
		if rr
			puts "Polygons intersect in points: #{polygons_intersections(@p1, @p2)}"
		end;	
	end;	


def sgn(n)
    	n <=> 0
  	end

	def polygons_intersect?(poly1, poly2) # finds out the FACT of two polygons intersection
		res=false
		poly1.each_with_index do |p1,idx1|
			next if idx1==poly1.size-1
			poly2.each_with_index do |p2,idx2|
				next if idx2==poly2.size-1
				res=lines_cross?([p1,poly1[idx1+1]], [p2, poly2[idx2+1]])
				break if res				 
			end;	
			break if res
		end;	
		return res
	end;

	def lines_cross?(line1, line2) # the FACT
		puts "-----"
		dx1=line1.last[:x]-line1.first[:x]
		dx2=line2.last[:x]-line1.first[:x]
		dx3=line2.first[:x]-line1.first[:x]

		dy1=line1.last[:y]-line1.first[:y]
		dy2=line2.last[:y]-line1.first[:y]
		dy3=line2.first[:y]-line1.first[:y]

		s1=dx2*dy1-dx1*dy2
		puts s1
		s2=dx3*dy1-dx1*dy3
		puts s2

		return false if sgn(s1)==sgn(s2)

		dx1=line2.last[:x]-line2.first[:x]
		dx2=line1.last[:x]-line2.first[:x]
		dx3=line1.first[:x]-line2.first[:x]

		dy1=line2.last[:y]-line2.first[:y]
		dy2=line1.last[:y]-line2.first[:y]
		dy3=line1.first[:y]-line2.first[:y]

		s1=dx2*dy1-dx1*dy2
		puts s1
		s2=dx3*dy1-dx1*dy3
		puts s2

		return self.sgn(s1)!=self.sgn(s2)
	end;

	def polygons_intersections(poly1, poly2) # finds out the FACT of two polygons intersection
		res=false
		iscts=[]
		poly1.each_with_index do |p1,idx1|
			next if idx1==poly1.size-1
			poly2.each_with_index do |p2,idx2|
				next if idx2==poly2.size-1
				res=lines_cross?([p1,poly1[idx1+1]], [p2, poly2[idx2+1]])
				if res 
					iscts<<lines_cross_point([p1,poly1[idx1+1]], [p2, poly2[idx2+1]])
					#break
				end				 
			end;	
			#break if res
		end;	
		return iscts
	end;

	def lines_cross_point(line1, line2) # finds out the intersection point of two lines
		puts "-----"
		dx1=line2.last[:x]-line2.first[:x]
		dx2=line1.last[:x]-line2.first[:x]
		dx3=line1.first[:x]-line2.first[:x]

		dy1=line2.last[:y]-line2.first[:y]
		dy2=line1.last[:y]-line2.first[:y]
		dy3=line1.first[:y]-line2.first[:y]

		s1=dx2*dy1-dx1*dy2
		puts s1
		s2=dx3*dy1-dx1*dy3
		puts s2

		return line1.last if s1==0 
		return line1.first if s2==0

		rx=line1.first[:x]+(line1.last[:x]-line1.first[:x])*(s2.fdiv(s1.abs+s2.abs).abs);
		# puts "dx2=#{dx2}"
		# puts "dx3=#{dx3}"
		# puts "line2.last[:x]=#{line2.last[:x]}"
		# puts "line2.first[:x]=#{line2.first[:x]}"
		# puts "s2.fdiv(s1.abs+s2.abs).abs=#{s2.fdiv(s1.abs+s2.abs).abs}"

		# puts "s2=#{s2}"
		# puts "s1=#{s1}"
		# puts "rx=#{rx}"

		# puts "-----"
		dx1=line1.last[:x]-line1.first[:x]
		dx2=line2.last[:x]-line1.first[:x]
		dx3=line2.first[:x]-line1.first[:x]

		dy1=line1.last[:y]-line1.first[:y]
		dy2=line2.last[:y]-line1.first[:y]
		dy3=line2.first[:y]-line1.first[:y]

		s1=dx2*dy1-dx1*dy2
		puts s1
		s2=dx3*dy1-dx1*dy3
		puts s2

		return line2.last if s1==0 
		return line2.first if s2==0
		
		ry=line2.first[:y]+(line2.last[:y]-line2.first[:y])*(s2.fdiv(s1.abs+s2.abs).abs);
		# puts "dy2=#{dy2}"
		# puts "dy3=#{dy3}"
		# puts "line1.last[:y]=#{line1.last[:y]}"
		# puts "line2.first[:y]=#{line1.first[:y]}"
		# puts "s2.fdiv(s1.abs+s2.abs).abs=#{s2.fdiv(s1.abs+s2.abs).abs}"

		# puts "s2=#{s2}"
		# puts "s1=#{s1}"
		# puts "ry=#{ry}"

		res={x:rx, y:ry}
		return res
	end;

	def draw
		(@p1.size-1).times do |i|
                #puts "poly=#{@poly}"
                Gosu.draw_line(@p1[i][:x],@p1[i][:y],Gosu::Color::WHITE, @p1[i+1][:x],@p1[i+1][:y],Gosu::Color::GRAY,POLYGON_LAYER);                
    	end
    	(@p2.size-1).times do |i|
                #puts "poly=#{@poly}"
                Gosu.draw_line(@p2[i][:x],@p2[i][:y],Gosu::Color::WHITE, @p2[i+1][:x],@p2[i+1][:y],Gosu::Color::GRAY,POLYGON_LAYER);                
    	end

	end;
end;





g=Intersector.new
g.show;