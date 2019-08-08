class MiniCollider
	def initialize(master,x,y)
		super(master,x,y)
	end;

	def update

	end;

	def draw
		#Здесь ничего не написано
	end;

	def sgn(n)
  		n <=> 0
	end

	def collide?(moving)		
		@master.master.obstacles.each do |still|
			if intersect?(moving, still)
				#@still=still
				return true;
			end;	
		end;	
		return false
	end;	

	def intersect?(moving, still)
			(moving.x1.between?(still.x1,still.x2) && moving.y1.between?(still.y1,still.y2)) ||
			(moving.x1.between?(still.x1,still.x2) && moving.y2.between?(still.y1,still.y2)) ||
			(moving.x2.between?(still.x1,still.x2) && moving.y1.between?(still.y1,still.y2)) ||
			(moving.x2.between?(still.x1,still.x2) && moving.y2.between?(still.y1,still.y2))
	end;

	def intersectCoords?(x1,y1,x2,y2,x3,y3,x4,y4)
			(x1.between?(x3,x4) && y1.between?(y3,y4)) ||
			(x1.between?(x3,x4) && y2.between?(y3,y4)) ||
			(x2.between?(x3,x4) && y1.between?(y3,y4)) ||
			(x2.between?(x3,x4) && y2.between?(y3,y4))
	end;

	def contact(moving)
		still=@still;
		dx=moving.x-moving.prevX;
		dy=moving.y-moving.prevY;

		hdg=dy.fdiv dx if dx!=0;	

		x=moving.prevX;
		y=moving.prevY;

		while !intersectCoords?(x, y, x+moving.w, y+moving.h, still.x1, still.y1, still.x2, still.y2)
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
		end;		
		side=case
			when (x.round+moving.w)==still.x1 then "left vertical"
			when x.round==still.x2 then "right vertical"
			when (y.round+moving.h)==still.y1 then "upper horizontal"
			when y.round==still.y2 then "lower horizontal"
		end;			
		
		return {safeX:prevX.round, 
				safeY:prevY.round, 
				contactX:x.round, 
				contactY:y.round, 
				contactType:side};
	end;	
end;		

class FallingCollider<MiniCollider
	def initialize(master,x,y)
		super(master,x,y)
	end;

	def update

	end;

	def draw
		#Здесь ничего не написано
	end;
end;	

class WalkingCollider<MiniCollider
	def initialize(master,x,y)
		super(master,x,y)
	end;

	def update

	end;

	def draw
		#Здесь ничего не написано
	end;
end;	

