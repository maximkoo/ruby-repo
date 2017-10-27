class Background<GameObject
    attr_accessor :x,:y,:angle
	def initialize(object_pool)
		@img=$background
		@x,@y,@angle=0,0,0
		@start_y=0; ## верхняя граница фона
		@xTiles,@yTiles=1+$window_width/@img.width, 1+$window_height/@img.height;
		@tiles=[]
		super(object_pool)

		@xTiles.times do |xi|
			@yTiles.times do |yi|
				@tiles<<{x:xi*@img.width, y:yi*@img.height, angle:90*rand(4).round}
			end;	
		end;	
		#puts @tiles;
	end;

	def update		
		$passed+=GAME_SPEED ###---<<<!!!!		
		@tiles.each do |t|
			t[:y]+=GAME_SPEED;
		end;	
		@start_y+=GAME_SPEED
		if @start_y>=0 # верхняя граница вылезла из-за края окна
			tiles1=[]
			@start_y-=@img.height;
			@xTiles.times do |xi|
				tiles1<<{x:xi*@img.width, y:@start_y, angle:90*rand(4).round}
			end;	
			@tiles=tiles1+@tiles
		end;
		#puts @start_y
		#puts @tiles.to_s
		@tiles.reject!{|a|a[:y]>$window_height}
		#puts @tiles.size
	end;

	def draw
		@tiles.each do |t|
			@img.draw_rot(t[:x]+@img.width/2,t[:y]+@img.height/2,BACKGROUND_LAYER, t[:angle]);
		end;	
	end;
end