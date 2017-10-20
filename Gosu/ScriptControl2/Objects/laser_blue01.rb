require './laser.rb'
class LaserBlue01<Laser
	SPEED=20;
	def initialize(object_pool, x,y, angle,source)
		@img=$laser_blue01;

		@xCenter=@img.width.fdiv(2)
        @yCenter=@img.height.fdiv(2)

		@poly=[{x:0,y:0}]
		ang=Math::PI*angle.fdiv(180)
		#@poly<<{x: (SPEED*Math.cos(ang)).round(2),y:-1*(SPEED*Math.sin(ang)).round(2)}
		#@poly<<{x: 0,y:-1*SPEED}
		@poly=@poly.map{|p| {:x=>p[:x]*Math.cos(ang)-p[:y]*Math.sin(ang), :y=>p[:x]*Math.sin(ang)+p[:y]*Math.cos(ang)}}
		#puts "Laser polygon: #{@poly}"

		super(object_pool, x,y, angle,source)
	end;
end;	
