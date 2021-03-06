class Collider
	def self.sgn(n)
  		n <=> 0
	end

	def self.intersect?(moving, still)
			(moving.x1.between?(still.x1,still.x2) && moving.y1.between?(still.y1,still.y2)) ||
			(moving.x1.between?(still.x1,still.x2) && moving.y2.between?(still.y1,still.y2)) ||
			(moving.x2.between?(still.x1,still.x2) && moving.y1.between?(still.y1,still.y2)) ||
			(moving.x2.between?(still.x1,still.x2) && moving.y2.between?(still.y1,still.y2))
	end;

	def self.intersectCoords(c1, c2)
			(c1[:x1].between?(c2[:x1],c2[:x2]) && c1[:y1].between?(c2[:y1],c2[:y2])) ||
			(c1[:x1].between?(c2[:x1],c2[:x2]) && c1[:y2].between?(c2[:y1],c2[:y2])) ||
			(c1[:x2].between?(c2[:x1],c2[:x2]) && c1[:y1].between?(c2[:y1],c2[:y2])) ||
			(c1[:x2].between?(c2[:x1],c2[:x2]) && c1[:y2].between?(c2[:y1],c2[:y2]))
	end;	

	def self.contact(moving, still)
		dx=moving.x-moving.prevX;
		dy=moving.y-moving.prevY;
		# if dx==0 return;

		hdg=dy.fdiv dx if dx!=0;	
		puts "hdg=#{hdg}"

		x=moving.prevX;
		y=moving.prevY;
		puts "Initial x=#{x}, y=#{y}"
		c1={x1:x, x2:x+moving.w, y1:y, y2:y+moving.h};
		c2={x1:still.x1, x2:still.x2, y1:still.y1, y2:still.y2};

		puts c1;
		puts c2;

		puts ":::::: HDG=#{hdg} ::::::"

		while !intersectCoords(c1, c2)
			prevX=x; prevY=y;
			puts "prevX=#{prevX}, prevY=#{prevY}"
			if dx==0
				y=y+sgn(dy);
			elsif hdg.abs<=1
				x=x+sgn(dx);
				y=y+hdg;
			else	
				y=y+sgn(dy);
				x=x+1.fdiv(hdg);
			end;	
			c1={x1:x.round, x2:x.round+moving.w, y1:y.round, y2:y.round+moving.h};	
		end;		

			#puts "Last safe values: prevX=#{prevX.round}, prevY=#{prevY.round}";
			#puts "Contact values: x=#{x.round}, y=#{y.round}"
			side=case
				when (x.round+moving.w)==still.x1 then "left vertical"
				when x.round==still.x2 then "right vertical"
				when (y.round+moving.h)==still.y1 then "upper horizontal"
				when y.round==still.y2 then "lower horizontal"
			end;			
			#puts "Contact detected on #{side} side";
			return {safeX:prevX.round, safeY:prevY.round, contactX:x.round, contactY:y.round, contactType:side};
	end;	


	def self.bounce(moving, still)

	end;	
end;	
