class TShape<Moving
	attr_reader :fourCoordsInCubes
	def initialize
		@fourCoordsInCubes=[[0,1],[1,1],[1,0],[2,1]]
		super
	end;
end;

class Stick<Moving
	attr_reader :fourCoordsInCubes
	def initialize
		@fourCoordsInCubes=[[1,0],[1,1],[1,2],[1,3]]
		super
	end;
end;

class SLeft<Moving
	attr_reader :fourCoordsInCubes
	def initialize
		@fourCoordsInCubes=[[0,0],[0,1],[1,1],[1,2]]
		super
	end;
end;

class SRight<Moving
	attr_reader :fourCoordsInCubes
	def initialize		
		@fourCoordsInCubes=[[1,0],[1,1],[0,1],[0,2]]
		super
	end;
end;

class CornerLeft<Moving
	attr_reader :fourCoordsInCubes
	def initialize
		@fourCoordsInCubes=[[0,0],[0,1],[1,1],[2,1]]
		super
	end;
end;

class CornerRight<Moving
	attr_reader :fourCoordsInCubes
	def initialize
		@fourCoordsInCubes=[[2,0],[0,1],[1,1],[2,1]]
		super
	end;
end;

class Cube<Moving
	def initialize
		@fourCoordsInCubes=[[0,0],[0,1],[1,0],[1,1]]
		super
	end;
end;