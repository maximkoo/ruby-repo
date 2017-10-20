class Utils
	def self.distance_between(x1,y1,x2,y2)
		return Math.sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))
	end;

	def self.sgn(n)
    	n <=> 0
  	end

	def self.polygons_intersect?(poly1, poly2) # finds out the FACT of two polygons intersection
		res=false
		poly1.each_with_index do |p1,idx1|
			next if idx1==poly1.size-1
			poly2.each_with_index do |p2,idx2|
				next if idx2==poly2.size-1
				res=self.lines_cross?([p1,poly1[idx1+1]], [p2, poly2[idx2+1]])
				break if res				 
			end;	
			break if res
		end;	
		return res
	end;
	
	def self.polygons_intersection_points(poly1, poly2) # finds out multiple intersection points

	end;

	def self.lines_cross?(line1, line2) # the FACT
		#puts "-----"
		dx1=line1.last[:x]-line1.first[:x]
		dx2=line2.last[:x]-line1.first[:x]
		dx3=line2.first[:x]-line1.first[:x]

		dy1=line1.last[:y]-line1.first[:y]
		dy2=line2.last[:y]-line1.first[:y]
		dy3=line2.first[:y]-line1.first[:y]

		s1=dx2*dy1-dx1*dy2
		#puts s1
		s2=dx3*dy1-dx1*dy3
		#puts s2

		return false if sgn(s1)==sgn(s2)

		dx1=line2.last[:x]-line2.first[:x]
		dx2=line1.last[:x]-line2.first[:x]
		dx3=line1.first[:x]-line2.first[:x]

		dy1=line2.last[:y]-line2.first[:y]
		dy2=line1.last[:y]-line2.first[:y]
		dy3=line1.first[:y]-line2.first[:y]

		s1=dx2*dy1-dx1*dy2
		#puts s1
		s2=dx3*dy1-dx1*dy3
		#puts s2

		return self.sgn(s1)!=self.sgn(s2)
	end;

	def self.polygons_intersections(poly1, poly2) # finds out the FACT of two polygons intersection
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

	def self.lines_cross_point(line1, line2) # finds out the intersection point of two lines
		#puts "-----"
		dx1=line2.last[:x]-line2.first[:x]
		dx2=line1.last[:x]-line2.first[:x]
		dx3=line1.first[:x]-line2.first[:x]

		dy1=line2.last[:y]-line2.first[:y]
		dy2=line1.last[:y]-line2.first[:y]
		dy3=line1.first[:y]-line2.first[:y]

		s1=dx2*dy1-dx1*dy2
		#puts s1
		s2=dx3*dy1-dx1*dy3
		#puts s2

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
		#puts s1
		s2=dx3*dy1-dx1*dy3
		#puts s2

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
end;	