require 'tk'
require './shapes.rb'
class Moving
	def initialize(cnv)

		@step=20
		x0=100
		y0=10
		coords=[]
		@figure=[]
		#coords = [[x0, y0], [x0+@step,y0+@step]]
		#@figure=TkcRectangle.new(cnv, coords, :fill=>"white")
		
		shapeTypes=[TShape,Stick,SLeft,SRight,CornerLeft,CornerRight,Cube];

		matchClass=shapeTypes[rand(7)];
		fourCoords=matchClass.new.getFourCoords
		#super(cnv, x0,y0,x0+@step,y0+@step, :fill=>"white")
		fourCoords.each do |c|
			coords<<[[(c.first*@step)+x0, (c.last*@step)+y0],[@step+(c.first*@step)+x0, @step+(c.last*@step)+y0]]
			@figure<<TkcRectangle.new(cnv, coords.last, :fill=>"white")
		end;	

		
	end;

	def moveDown
		#puts @figure.coords.to_s;
		#@figure.coords.map!{|q| q+@step}
		#@figure.coords=[200,200,210,210]
		@figure.each do |r|
			r.move(0,1*@step)
		end;
	end;	

	def moveLeft
		@figure.each do |r|
			r.move(-1*@step,0)
		end;
	end;
	
	def moveRight
		@figure.each do |r|
			r.move(1*@step,0)
		end;
	end;


	# def coords
	# 	@figure.coords
	# end;	
end;