class Detector<MovableGameObject
	attr_accessor :controlPoints
	def initialize(master,x,y)
		super(master,x,y)
		@controlPoints=[]

		@w,@h=master.w,master.h;
		reset(x,y)
	end;
	
	def reset(x,y)	
		@controlPoints=[]
		@controlPoints<<{:x=>x,:y=>y-1};			#0 NW
		@controlPoints<<{:x=>x+@w/2,:y=>y-1};		#1 N
		@controlPoints<<{:x=>x+@w-1,:y=>y-1};		#2 NE
		@controlPoints<<{:x=>x,:y=>y+@h/2};		#3 W
		@controlPoints<<{:x=>x+@w/2,:y=>y+@h/2};	#4 C
		@controlPoints<<{:x=>x+@w-1,:y=>y+@h/2};	#5 E
		@controlPoints<<{:x=>x,:y=>y+@h+1};		#6 SW
		@controlPoints<<{:x=>x+@w/2,:y=>y+@h+1};	#7 S
		@controlPoints<<{:x=>x+@w-1,:y=>y+@h+1};	#8 SE
	end;

	def move
		@controlPoints.each do |cp|
			cp[:x]+=@xS; cp[:y]+=@yS;
		end;	
	end;	

	def update
		@controlPoints.each do |cp|
			#puts cp;
			#cp["type"]=$collider.objectsByPoint(cp[:x],cp[:y]);
			cp["type"]=@master.master.master.objectsByPoint(cp[:x],cp[:y]);
		end;	
	end;	
end;		

class WalkingDetector<Detector
	def initialize(master,x,y)
		super(master,x,y)
		@xS=master.xS;
		@yS=master.yS;
	end;	

	def update
		@x,@y=@master.x,@master.y
		@xS=master.xS;
		@yS=master.yS;
		#puts @x,@y
		#reset(@x,@y);
		move;
		super
		#puts @controlPoints[6]
		#puts @controlPoints[8]
		 if !@controlPoints[6]["type"].include?(OBSTACLE) && !@controlPoints[8]["type"].include?(OBSTACLE)
		 	@master.master.toState(@master,"fall");
		 end;	
	end;
	
	#def draw

	#end;	
end;	