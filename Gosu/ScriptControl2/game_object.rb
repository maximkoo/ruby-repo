class GameObject
	attr_accessor :components, :expired, :poly, :mileage
	def initialize(object_pool)
		@components=[]
		@object_pool=object_pool
		@object_pool.objects<<self
		@expired=false;
		@mileage=0;
	end;

	def update

	end;
	
	def draw

	end;

	def destruct
		puts :destruct
	end;

	def inflict_loss(damage, another_object)

	end;	

	def default_routine

	end;	
end;