class WalkingDetector<Detector
	def initialize(master,x,y)
		super(master,x,y)		
	end;	

	def update
		super		
		### WALKING TO FALLING ###
		if !@controlPoints[6]["type"].include?(OBSTACLE) && !@controlPoints[8]["type"].include?(OBSTACLE)
		 	@master.master.toState(@master,"fall");
		end;	
	end;
end;