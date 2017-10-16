class ObjectPool
	attr_accessor :objects
	def initialize
		@objects=[]
	end;

	def nearby(object)
		@objects.select do|obj|
			obj!=object && obj.class!=Explosion && (Utils.distance_between(object.x+object.xCenter, object.y+object.yCenter, obj.x+obj.xCenter, obj.y+obj.yCenter)<NEARBY_DISTANCE || obj.class==SpaceStationHat) 
			#puts :sglhs if object.class==SpaceStationHat
		end;	
	end;	
end;