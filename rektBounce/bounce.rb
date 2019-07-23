require 'gosu';
require './rectangle'
require './collider'
FRAME_DELAY=24

class Bounce < Gosu::Window
    def initialize
      super(640, 400, false);

      @still=Rectangle.new(300,200,100,100, Gosu::Color::RED);
      @moving=Rectangle.new(300,35n0,23,23,Gosu::Color::WHITE);
      @obj=[@moving,@still];

      @xS=1; @yS=-6;
      @go=true;

    end

    def needs_cursor?
    	true
  	end

    def update
    	exit if @moving.y>1000 || @moving.x<0 || @moving.y<0 || @moving.x>1000
    	now=Gosu.milliseconds
    	return if (now-@last_update||=now) < FRAME_DELAY 
    	return if !@go
    	@moving.move(@xS, @yS);

    	if Collider.intersect?(@moving,@still);
    		# @xS=0; @yS=0;
    		puts @moving.x1, @moving.y1;
    		puts @moving.x2, @moving.y2; 
    		puts "----";
    		contact=Collider.contact(@moving,@still);
    		@moving.x=contact[:contactX];
    		@moving.y=contact[:contactY];
    		# @go=false
    		if contact[:contactType]=~/horizontal/
    			@yS=-@yS
    		end;
    		if contact[:contactType]=~/vertical/
    			@xS=-@xS
    		end;

    	end;	

    	@last_update=now; 
    	    	
    end

    def draw
    	@obj.each do |r|
       		r.draw();
   		end;
    end;   
 end
$b=Bounce.new;
$b.show;