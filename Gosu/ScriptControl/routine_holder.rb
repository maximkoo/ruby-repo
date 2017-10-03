class RoutineHolder
	attr_accessor :routines
	def initialize
		@routines=[]
		a=Proc.new do |obj| 		 	
		 	if obj.y<400
		 		obj.move
		 		obj.shoot
		 	else
		 		obj.next
		 	end;	 
		 end;	
		
		b=Proc.new do |obj|	
		 	if obj.angle%360!=0
		 		obj.rotate_left
		 		obj.shoot
		 		obj.move
		 	else
		 		obj.move
		 		obj.next if obj.y<100;
		 	end;	
		 end;

		c=Proc.new do |obj|	
		 	if (obj.angle%360>180) || (obj.angle%360==0)
		 		obj.rotate_left
		 		obj.move
		 		obj.rewind if obj.angle%360==180;		 		
		 	end;	
		 end; 
		@routines<<[a,b,c] 
	end;

	def routine(obj_id, cr)
		@routines[obj_id][cr]
	end;
end;	