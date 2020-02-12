require 'gosu'
require './gosu_geom.rb'
FRAME_DELAY=100             


class GameWindow<Gosu::Window
	attr_accessor :bars
	def initialize
		super(500,500)
		
		@bars=[]
		create_bars

		@looker=Looker.new(self)
	end;

	def needs_cursor?
    	true
  	end

  	def update
  		now=Gosu.milliseconds
	  	return if (now-@last_update||=now) < FRAME_DELAY 
	    @looker.update;
	  	@last_update=now;  		
  	end;
  	
  	def draw
  		@looker.draw;
  		@bars.each {|b| b.draw}
  	end;	

  	def create_bars
  		@bars<<Bar.new(GosuGeom::Point.new(100,50),GosuGeom::Point.new(150,50))
  		@bars<<Bar.new(GosuGeom::Point.new(150,50),GosuGeom::Point.new(150,100))
  		@bars<<Bar.new(GosuGeom::Point.new(150,100),GosuGeom::Point.new(100,100))
  		@bars<<Bar.new(GosuGeom::Point.new(100,100),GosuGeom::Point.new(100,50))

  		@bars<<Bar.new(GosuGeom::Point.new(100,300),GosuGeom::Point.new(100,350))
  		@bars<<Bar.new(GosuGeom::Point.new(100,350),GosuGeom::Point.new(0,350))
  		@bars<<Bar.new(GosuGeom::Point.new(0,  350),GosuGeom::Point.new(0,300))
  		@bars<<Bar.new(GosuGeom::Point.new(0,  300),GosuGeom::Point.new(100,300))

  		@bars<<Bar.new(GosuGeom::Point.new(300,400),GosuGeom::Point.new(350,450))
  		@bars<<Bar.new(GosuGeom::Point.new(350,450),GosuGeom::Point.new(400,400))
  		@bars<<Bar.new(GosuGeom::Point.new(400,400),GosuGeom::Point.new(350,350))
  		@bars<<Bar.new(GosuGeom::Point.new(350,350),GosuGeom::Point.new(300,400))
  		
  		@bars<<Bar.new(GosuGeom::Point.new(200,400),GosuGeom::Point.new(250,400))
  		@bars<<Bar.new(GosuGeom::Point.new(250,400),GosuGeom::Point.new(250,450))
  		@bars<<Bar.new(GosuGeom::Point.new(250,450),GosuGeom::Point.new(200,450))
  		@bars<<Bar.new(GosuGeom::Point.new(200,450),GosuGeom::Point.new(200,400))
  	end;	
end;

class Bar
	attr_accessor :p1,:p2, :visible
	def initialize(p1,p2)
		@p1,@p2=p1,p2
		@visible=true;
	end

	def draw
		Gosu.draw_line(@p1.x,@p1.y,Gosu::Color::GREEN,@p2.x,p2.y,Gosu::Color::GREEN,10) if @visible
	end;	
end;	

class BarLine<GosuGeom::Segment
	attr_accessor :bar
	def initialize(p1,p2,bar)
		@bar=bar;
		super(p1,p2)
	end;	
end;	

class Looker
	attr_accessor :x,:y,:ang,:speed, :angspeed, :pv
	def initialize(master)
		@master=master;
		@ang=0;
		@x,@y=250,250
		@speed=8
		@angspeed=3
		@pv=[]
		@pv<<GosuGeom::Point.new(-250,-250)
		@pv<<GosuGeom::Point.new(750,-250)
		@lines=[]	
		
	end;

	def rotate(ang0)
		ang=Math::PI*ang0.fdiv(180)
		@pv.map! do |p|
			px=(p.x-@x)*Math.cos(ang)-(p.y-@y)*Math.sin(ang)	
			py=(p.x-@x)*Math.sin(ang)+(p.y-@y)*Math.cos(ang)
			GosuGeom::Point.new(px+@x,py+@y)
		end;	
	end;	

	def move(speed,ang)		
		#puts "#{@x} #{@y} #{@speed} #{ang}"		 
		dx=Gosu.offset_x(ang, speed)
		dy=Gosu.offset_y(ang, speed)
		[self, *@pv].each do |p|
			p.x+=dx
		end;
		[self, *@pv].each do |p|
			p.y+=dy
		end;		
	end;	

	def update
		keyControl
		check_bars
		create_lines
		cross_lines
	end;

	def create_lines
		@lines=[]
		@master.bars.select{|s| s.visible}.each do |bar|
			@lines<<BarLine.new(GosuGeom::Point.new(@x,@y),GosuGeom::Point.new(bar.p1.x,bar.p1.y),bar);
			@lines<<BarLine.new(GosuGeom::Point.new(@x,@y),GosuGeom::Point.new(bar.p2.x,bar.p2.y),bar);
		end;	
	end;	

	def cross_lines
		@crossbars=[]
		puts "Total bars #{@master.bars.select{|s| s.visible}.count}"
		@master.bars.select{|s| s.visible}.each do |bar1|
			@lines.each do |line|
				p=GosuGeom.intersection(bar1,line);
				if !p.nil?  && bar1.object_id!=line.bar.object_id
					puts "Bar: #{bar1.p1.x},#{bar1.p1.y} - #{bar1.p2.x},#{bar1.p2.y}, object_id=#{bar1.object_id}, line: #{line.p1.x},#{line.p1.y} - #{line.p2.x},#{line.p2.y}, line.bar=#{line.bar.object_id}"
					puts p
					@crossbars<<bar1
				end;	
			end;	
		end;
		if $g.button_down?(Gosu::KbSpace)
    		puts "@crossbars.count=#{@crossbars.count}"
    		puts "Unique #{@crossbars.uniq.count}"
    	end;
	end;	

	def draw_lines
		@master.bars.select{|s| s.visible}.each do |bar|
			Gosu.draw_line(@x,@y,Gosu::Color::RED, bar.p1.x, bar.p1.y, Gosu::Color::RED,10)
			Gosu.draw_line(@x,@y,Gosu::Color::RED, bar.p2.x, bar.p2.y, Gosu::Color::RED,10)
		end;	
	end;	

	def check_bars
		@master.bars.each do |p|
			if !GosuGeom.point_in_view_xy?(@x,@y,p.p1,@ang,90) && !GosuGeom.point_in_view_xy?(@x,@y,p.p2,@ang,90)
				p.visible=false
			else
				p.visible=true;
			end;	
		end;	
	end;

	def keyControl
		if $g.button_down?(Gosu::KbRight)
    		@ang+=@angspeed	    		
    		rotate(@angspeed)
    	elsif $g.button_down?(Gosu::KbLeft)
    		@ang-=@angspeed
    		rotate(-@angspeed)
    	end;
    	if $g.button_down?(Gosu::KbUp)
    		move(@speed, @ang)
    	elsif $g.button_down?(Gosu::KbDown)
    		move(-@speed, @ang)	
    	end
    		
    	#puts "ccc=#{@ccc}"
	end;
		
	def draw
		#Gosu.draw_triangle(@x,@y,Gosu::Color::WHITE,pv[0].x,pv[0].y,Gosu::Color::WHITE,pv[1].x,pv[1].y,Gosu::Color::WHITE,10)
		Gosu.draw_line(@x,@y,Gosu::Color::WHITE,@pv[0].x,@pv[0].y,Gosu::Color::WHITE,10)
		Gosu.draw_line(@x,@y,Gosu::Color::WHITE,@pv[1].x,@pv[1].y,Gosu::Color::WHITE,10)
		draw_lines
	end;	
end;	

$g=GameWindow.new
$g.show;