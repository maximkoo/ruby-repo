class ObjectPool
	attr_accessor :objects
	def initialize
		@objects=[]
	end;

	def nearby(object)
		
		@objects.select do|obj|
			#obj!=object && obj.class!=Explosion && obj.class!=Background && !obj.class.ancestors.include?(Laser)&&(Utils.distance_between(object.x, object.y, obj.x, obj.y)<NEARBY_DISTANCE || obj.class.ancestors.include?(Boss))
			res=true;
			res=res && obj!=object
			res=res && obj.class!=Explosion
			res=res && obj.class!=Background
			res=res && obj.class!=EnergyBar
			res=res && !obj.class.ancestors.include?(Laser)
			res=res && (Utils.distance_between(object.x, object.y, obj.x, obj.y)<NEARBY_DISTANCE || obj.class.ancestors.include?(Boss))
			res
		end;	
	end;	
end;