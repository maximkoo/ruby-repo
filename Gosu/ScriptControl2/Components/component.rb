class Component
	def initialize(obj)
		if !obj.nil?
			@object=obj
			obj.components<<self
		end;
	end;

	def update

	end;

	def draw

	end;	
end;	
