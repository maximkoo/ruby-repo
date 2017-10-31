class EnergyBar<Component
	attr_accessor :value
	def initialize(obj)
		super(obj)
		@x=10; @y=10; @value=100;
		#@x,@y,@value=x,y,value;
	end;

	def update
		@value=@object.energy;
	end;
	
	def draw
		barWidth=($window_width-(2*@x))*(@value.fdiv(100))
		#puts @value;
		#puts barWidth;
		Gosu.draw_rect(@x,@y, barWidth, 15, Gosu::Color::RED, INTERFACE_LAYER);
	end;	
	

end;	