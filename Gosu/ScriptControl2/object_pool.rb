class ObjectPool
	attr_accessor :objects
	def initialize
		@objects=[]
	end;

	def nearby(object)
		@objects.select do|obj|
			obj!=object && obj.class!=Explosion && !obj.class.ancestors.include?(Laser)&&(Utils.distance_between(object.x+object.xCenter, object.y+object.yCenter, obj.x+obj.xCenter, obj.y+obj.yCenter)<NEARBY_DISTANCE) 
			#obj!=object && (Utils.distance_between(object.x+object.xCenter, object.y+object.yCenter, obj.x+obj.xCenter, obj.y+obj.yCenter)<NEARBY_DISTANCE) 
			#puts :sglhs if object.class==SpaceStationHat
		end;	
	end;	
end;