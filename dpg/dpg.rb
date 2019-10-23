require 'gosu'

class Dpg<Gosu::Window
	SCREEN_WIDTH=40; #Gosu.screen_width;
	SCREEN_HEIGHT=40;#Gosu.screen_height;
	CELLSIZE=10;
	SPEED=CELLSIZE
	FRAME_DELAY=160
	def initialize
		super(SCREEN_WIDTH*CELLSIZE,SCREEN_HEIGHT*CELLSIZE, false)
		(0..3).each do |i|			
			c=Cell.new(20,20-i,@head);
			#puts c.inspect
			@head=c 
		end
		get_new_target;
		@xSpeed=0;
		@ySpeed=-1
		@blocked=false;
		@stopped=false;
		@font = Gosu::Font.new(self, "Arial", 18)
		#showList		
	end;

	def needs_cursor?
    	true
  	end

  	def showList
  		c=@head
  		loop do
  			puts c.inspect
  			break if c.nxt.nil?
  			c=c.nxt
  		end;	
  	end;	

  	def update
    	now=Gosu.milliseconds
    	return if (now-@last_update||=now) < FRAME_DELAY 
    	@last_update=now;
    	move;
    	@blocked=false;

    	if eat?
  			get_new_target 
  			c=@head
  			loop do
  				if c.nxt.nil?
  					4.times do
  						c1=Cell.new(c.x,c.y,nil);
  						c.nxt=c1;
  						c=c1;
  					end;	
  				break	
  				end	
  				c=c.nxt
  			end;
  		end;
    end;

    def get_new_target
    	@target=Cell.new(rand(SCREEN_WIDTH),rand(SCREEN_HEIGHT),nil);
    end;	
  	
	def button_down(id)		
        if id==Gosu::KbLeft && @xSpeed!=1 &&!@blocked
      		@xSpeed=-1;	@ySpeed=0; @blocked=true;
    	end;

    	if id==Gosu::KbRight  && @xSpeed!=-1&&!@blocked
      		@xSpeed=1;	@ySpeed=0; @blocked=true;
    	end;

    	if id==Gosu::KbUp && @ySpeed!=1&&!@blocked
      		@xSpeed=0;	@ySpeed=-1; @blocked=true;
    	end;

    	if id==Gosu::KbDown && @ySpeed!=-1&&!@blocked
      		@xSpeed=0;	@ySpeed=1; @blocked=true;
    	end; 

	end;

  	def move
  		#x,y=@head.x,@head.y
  		return if @stopped
  		c=@head.clone  		
  		@head.x=@head.x+@xSpeed
  		@head.y=@head.y+@ySpeed
  		c1=@head.nxt
  		loop do 
  			c2=c1.clone;
  			c1.x,c1.y=c.x,c.y
  			break if c1.nxt.nil?
  			c=c2.clone;
  			c1=c2.nxt;
  		end;


  	end;	

  	def eat?
  		@head.x==@target.x && @head.y==@target.y
  	end;	

  	def hit?
  		return true if @head.x<0 || @head.y<0 || @head.x>SCREEN_WIDTH || @head.y>SCREEN_HEIGHT
  		c=@head.nxt
  			loop do
  				return true if c.x==@head.x && c.y==@head.y
  				break if c.nxt.nil?
  				c=c.nxt;
  			end;		
  	end;	

  	def draw
  		c=@head
  		loop do 
  			Gosu.draw_rect(c.x*CELLSIZE, c.y*CELLSIZE, CELLSIZE,CELLSIZE,Gosu::Color::RED,10);
  			break if c.nxt.nil?
  			c=c.nxt;
  		end;
  		
  		Gosu.draw_rect(@target.x*CELLSIZE, @target.y*CELLSIZE, CELLSIZE,CELLSIZE,Gosu::Color::GREEN,10) if !@target.nil?;

  		if hit?
  			@xSpeed=0; @ySpeed=0; @stopped=true;
  			
  			@font.draw("GAME OVER",100,100,20,2,2,Gosu::Color::WHITE)
  		end;		
  	end;	
end;

class Cell
	attr_accessor :x,:y,:nxt
	def initialize(x,y,nxt)
		@x,@y=x,y
		@nxt=nxt
	end;
end;

dpg=Dpg.new
dpg.show;	