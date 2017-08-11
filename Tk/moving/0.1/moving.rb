class Moving
	attr_accessor :fourCubes

	def initialize(cnv)
		@xPosInCubes=4;
		@yPosInCubes=0;
		@xPosInPixels=0
		@yPosInPixels=0

		#@fourCoordsInCubes=[]
		@fourCubes=[]

		@@shapeTypes=[TShape,Stick,SLeft,SRight,CornerLeft,CornerRight,Cube];
	end;	

	def self.getShape
		r=@@shapeTypes[rand(7)].new;
		r.fourCoordsInCubes.each do
			coords<<[[(c.first*@step)+@x0*@step, (c.last*@step)+@y0*@step],[@step+(c.first*@step)+@x0*@step, @step+(c.last*@step)+@y0*@step]]
			r.fourCubes<<@figure<<TkcRectangle.new(cnv, coords.last, :fill=>"white")
		end;
	end;	

	def moveDown
		@yPosInCubes+=1
	end;	

end;