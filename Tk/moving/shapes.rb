class TShape
	def initialize
		@fourCoords=[[0,1],[1,1],[1,0],[2,1]]
	end;

	def getFourCoords
		@fourCoords
	end;
end;

class Stick
	def initialize
		@fourCoords=[[0,0],[0,1],[0,2],[0,3]]
	end;

	def getFourCoords
		@fourCoords
	end;
end;

class SLeft
	def initialize
		@fourCoords=[[0,0],[0,1],[1,1],[1,2]]
	end;

	def getFourCoords
		@fourCoords
	end;
end;

class SRight
	def initialize
		@fourCoords=[[1,0],[1,1],[0,1],[0,2]]
	end;

	def getFourCoords
		@fourCoords
	end;
end;

class CornerLeft
	def initialize
		@fourCoords=[[0,0],[0,1],[1,1],[2,1]]
	end;

	def getFourCoords
		@fourCoords
	end;
end;

class CornerRight
	def initialize
		@fourCoords=[[2,0],[0,1],[1,1],[2,1]]
	end;

	def getFourCoords
		@fourCoords
	end;
end;

class Cube
	def initialize
		@fourCoords=[[0,0],[0,1],[1,0],[1,1]]
	end;

	def getFourCoords
		@fourCoords
	end;
end;