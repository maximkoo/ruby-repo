class AbstractObject
	attr_accessor :layer
	def initialize(layer)
		@layer=layer
		@layer.objects<<self
	end;
end;

class EmptyObject
		
end;

class TiledObject

end;