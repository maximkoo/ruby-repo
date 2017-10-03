class GameObject
	attr_accessor :components
	def initialize(object_pool)
		@components=[]
		@object_pool=object_pool
		@object_pool.objects<<self
	end;

	def update

	end;
	
	def draw

	end;	
end;	