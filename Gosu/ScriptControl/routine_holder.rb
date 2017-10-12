class RoutineHolder
	attr_accessor :routines
	def initialize
		@routines={}
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
		 			#obj.shoot
		 		obj.next if obj.y<100;
		 	end;	
		 end;

		c=Proc.new do |obj|	
		 	if (obj.angle%360>180) || (obj.angle%360==0)
		 		obj.rotate_left
		 		obj.move
		 		obj.rewind if obj.angle%360==180;	
		 		#obj.destruct if obj.angle%360==180;	 		
		 	end;	
		 end; 
		#@routines<<[a,b,c]
		@routines[0]=[a,b,c] 
		a=Proc.new do |obj|
			obj.shoot;
		end;
		#@routines<<[a]
		@routines[1]=[a]

		a=Proc.new do |obj|
			 obj.shoot if (obj.angle%360).between?(-10, 10)
			obj.rotate_right
			obj.move			
		end;	
		@routines[10]=[a]
	end;

	def routine(obj_id, cr)
		@routines[obj_id][cr] if !@routines[obj_id].nil?
	end;
end;	