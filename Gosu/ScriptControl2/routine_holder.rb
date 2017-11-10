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

		@routines[:rotate_left]=[Proc.new{|obj| obj.rotate_left}]

		@routines[:shoot_only]=[Proc.new{|obj| obj.shoot}]	

		a=Proc.new do |obj|
			 obj.shoot if (obj.angle%360).between?(-10, 10)
			obj.rotate_right
			obj.move			
		end;	
		@routines[10]=[a]

		#@routines[0]=[a,b,c] 
		a=Proc.new do |obj|
			obj.shoot;			
			obj.move
		end;
		@routines[:shoot_move]=[a]

	### with mlieage ###
	a=Proc.new do |obj|
		if obj.mileage<200
			#puts obj.mileage
			obj.move;
		else
			obj.next
		end;	
	end;
	b=Proc.new do |obj|
		#puts obj.angle
		if obj.angle<135
			#puts "left"
			obj.rotate_right;
			obj.move;
			#obj.shoot;
		else 
			obj.next;
		end;
	end;
	c=Proc.new do |obj|
		if obj.mileage<400
			  obj.move;
			  obj.shoot;
		else
			obj.next;
		end;		
	end;	
	d=Proc.new do |obj|
		if obj.angle>45
			obj.rotate_left;
			obj.move;
			#obj.shoot;
		else 
			obj.next;
		end;
	end;		
	e=Proc.new do |obj|
		obj.move;		
	end;
	@routines[:wave_down]=[a,b,c,d,e]	

	f=Proc.new do |obj|
		if obj.y<100
			obj.stop;
		elsif obj.x>380
			obj.move;
		else
			obj.next
		end;
	end;	
	g=Proc.new do |obj|
		obj.rotate_left
		obj.move
		if (obj.angle%360).between?(0,180)
			obj.shoot;
		end;
		if obj.angle<-270
			obj.next;
		end;	
	end;
	g1=Proc.new do |obj|
		obj.move;
	end;	
	@routines[:round_shoot]=[f,g, g1]

	f=Proc.new do |obj|
		if obj.y<100
			obj.stop;
		elsif obj.x<300
			obj.move;
		else
			obj.next
		end;
	end;	
	g=Proc.new do |obj|
		obj.rotate_right
		obj.move
		if (obj.angle%360).between?(0,180)
			obj.shoot;
		end;
		if obj.angle>=270+360
			obj.next;
		end;	
	end;
	g1=Proc.new do |obj|
		obj.move;
	end;	
	@routines[:round_shoot_left]=[f,g, g1]

	af=Proc.new do |obj|
		if obj.y<200
			obj.move
		elsif obj.mileage>260
			obj.move
		else	
			obj.float;
			obj.shoot;		
		end;
	end;	
	@routines[:appear_and_float]=[af]

	s1=Proc.new do |obj|
		if obj.y<200
			obj.move
		elsif obj.angle<270
			obj.float
			obj.rotate_right_slow
		else
			obj.next;
		end;
	end;	
	s2=Proc.new do |obj|
		if obj.angle>-90
			obj.float;
			obj.rotate_left
		else
			obj.move
		end;		
	end;	
	@routines[:satellite]=[s1,s2]

	ttt=Proc.new do |obj|
		if obj.y<100
			obj.stop
		elsif obj.x<300
			obj.move;
		else 
			obj.look_down;
			obj.stop;
			obj.next;
		end;
		#puts obj.x, obj.y	
	end;	
	tttt=Proc.new do |obj|
			obj.strafe_right;
			obj.shoot;
		end;	
	@routines[:strafe_shoot]=[ttt,tttt]	

	q=Proc.new do |obj|
		if obj.y<300
			obj.move
		else	
			obj.float if obj.mileage<350;
			obj.move if obj.mileage>=350;
			obj.shoot;			
		end;
	end;

	@routines[:float_shoot]=[q]	
end;

	def routine(obj_id, cr)
		@routines[obj_id][cr] if !@routines[obj_id].nil?
	end;
end;	