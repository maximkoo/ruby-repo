class MapObject<MovableGameObject
	attr_accessor :name,:type,:visible,:enabled,:layer
	def initialize(master,x,y)
		super(master,x,y);
	end;

	def move
		super
		#setX(@x+@xS);
		#setY(@y+@yS)
	end;	
	
	def update		
		return unless [VIRTUAL, PLATFORM].include? @type 
		#@qq.call(self)
	end;

	def disappear
		@visible=false;
	end;

	def appear
		@visible=true;
	end;	

	def visible?
		@visible
	end;		
end;