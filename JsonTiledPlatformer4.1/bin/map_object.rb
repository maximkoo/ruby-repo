class MapObject<MovableGameObject
	attr_accessor :name,:type,:visible,:enabled,:layer
	def initialize(x,y)
		super(x,y);
	end;

	def move
		super
		#setX(@x+@xS);
		#setY(@y+@yS)
	end;	
	
	def update
		return unless [VIRTUAL, PLATFORM].includes? @type 
		#@qq.call(self)
	end;
end;