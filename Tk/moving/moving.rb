require 'tk'
require './shapes.rb'
class Moving
	def initialize(cnv)

		@step=20
		@x0=5
		@y0=0
		coords=[]
		@figure=[]
		@fwidth=@fheight=0
		#coords = [[x0, y0], [x0+@step,y0+@step]]
		#@figure=TkcRectangle.new(cnv, coords, :fill=>"white")
		
		shapeTypes=[TShape,Stick,SLeft,SRight,CornerLeft,CornerRight,Cube];

		matchClass=shapeTypes[rand(7)];
		matchClass=shapeTypes[6];
		@fourCoords=matchClass.new.getFourCoords
		#super(cnv, x0,y0,x0+@step,y0+@step, :fill=>"white")
		@fourCoords.each do |c|
			coords<<[[(c.first*@step)+@x0*@step, (c.last*@step)+@y0*@step],[@step+(c.first*@step)+@x0*@step, @step+(c.last*@step)+@y0*@step]]
			@figure<<TkcRectangle.new(cnv, coords.last, :fill=>"white")
		end;
		@fwidth=@fourCoords.map{|z|z.first}.max 
		@fheight=@fourCoords.map{|z|z.last}.max			
	end;

	def moveDown
		#puts @figure.coords.to_s;
		#@figure.coords.map!{|q| q+@step}
		#@figure.coords=[200,200,210,210]
		@figure.each do |r|
			r.move(0,1*@step)
		end;
		#@y0+=@step
		@y0+=1
	end;	

	def moveLeft
		puts @x0
		puts @fwidth
		return if @x0<=0
		@figure.each do |r|
			r.move(-1*@step,0)
		end;
		#@x0-=@step
		@x0-=1
	end;
	
	def moveRight
		puts @x0
		puts @fwidth
		return if @x0+@fwidth>=10
		@figure.each do |r|
			r.move(1*@step,0)
		end;
		#@x0+=@step
		@x0+=1
	end;

	def rotate
		@fourCoords.rotate;
		icoords=[]
		z=0
		@fourCoords.each do |c|
			icoords<<[[(c.first*@step)+@x0*@step, (c.last*@step)+@y0*@step],[@step+(c.first*@step)+@x0*@step, @step+(c.last*@step)+@y0*@step]]
			@figure[z].coords=icoords.last
			z+=1
		end;
		@fwidth=@fourCoords.map{|z|z.first}.max 
		@fheight=@fourCoords.map{|z|z.last}.max
	end;	
end;

class Array
	def trans
        self.map!{|z| z.reverse!}
	end;     

	def flip
        s=self.map{|z|z.first}.max
        self.map!{|z| [s-z.first,z.last]}
	end;

	def flop
        s=self.map{|z|z.last}.max
        self.map!{|z| [z.first,s-z.last]}
	end;  

	def rotate
		sx=self.map{|z|z.first}.max 
		sx=2 if sx<2
		sy=self.map{|z|z.last}.max
		sy=2 if sy<2
		self.map!{|z|[sy-z.last,z.first]}
	end;  
end;

	# def coords
	# 	@figure.coords
	# end;	
