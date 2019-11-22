class ClimbingDetector<Detector
	def initialize(master,x,y)
		super(master,x,y)
	end;	

	def update
		super
		if !@controlPoints[4]["type"].include?(LADDER) && !@controlPoints[7]["type"].include?(LADDER)
		 	@master.master.toState(@master,"stop");
		end;	
	end;
end;