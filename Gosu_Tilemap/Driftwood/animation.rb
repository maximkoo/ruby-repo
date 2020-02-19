class Animation
	attr_reader :current_frame, :gid
	def initialize(master, data) # master is a tileset
		@gid=data["id"]
		@animation=data["animation"]
		@current_frame=0
		@last_update=Time.now
	end;

	def update		
		puts "Time.now-@last_update=#{1000*(Time.now-@last_update)}"
		puts "duration is #{@animation[@current_frame]["duration"]}"
		if 1000*(Time.now-@last_update)>@animation[@current_frame]["duration"]
			puts "Duration of the current frame is #{@animation[@current_frame]["duration"]}"
			@current_frame=(1+@current_frame) % @animation.size
			@last_update=Time.now
		end;	
		puts "#{@current_frame}, #{@animation.size}"
	end;	

	def current_gid
		@animation[@current_frame]["tileid"]
	end;	
end;	
