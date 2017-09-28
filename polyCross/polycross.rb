require 'gosu'

class GameWindow<Gosu::Window
  FRAME_DELAY=100.fdiv(32);
  def initialize
    super(600,600,fullscreen=false)
    @poly=[]
    makePolygon;
    @line=[]
    makeLine;
    #puts sgn(1)
    #puts sgn(0)
    #puts sgn(-123.22)
    @detects=[]
    @i=[]
    @shells=[]
    #detectIntersections(@poly, @line)
    findIntersections(@poly, @line)    
  end
  
  def sgn(n)
    n <=> 0
  end

#def pp
#  qq=@poly.sort{|a,b| a[:x]<=>b[:x]}
#puts "---"
#    puts qq
#end;  

  def makePolygon
    @poly<<{x:110,y:110}
    @poly<<{x:200,y:150}
    @poly<<{x:300,y:250}
    @poly<<{x:350,y:290}
    @poly<<{x:150,y:390}
    @poly<<{x:250,y:320}
    @poly<<{x:100,y:250}
    @poly<<{x:200,y:300}
    @poly<<@poly.first.clone
    puts @poly
  end;

  def makeLine
    @line<<{x:0, y:0}
    @line<<{x:301, y:400}
  end;

  def detectIntersections(poly, line)
    xx1=line.first[:x]; yy1=line.first[:y];xx2=line.last[:x]; yy2=line.last[:y]; ss=(yy2-yy1).fdiv(xx2-xx1) #ss=(xx2-xx1).fdiv(yy2-yy1)
    puts "ss=#{ss}"
    @poly.each_with_index do |p, idx|
      next if idx+1==@poly.size
      x1=p[:x]; y1=p[:y]; x2=poly[idx+1][:x]; y2=poly[idx+1][:y]
      #s=(x2-x1).fdiv(y2-y1)
      s=(y2-y1).fdiv(x2-x1)

      next unless x1<=xx2 && xx1<=x2 

      mmm=[xx1,xx2,x1,x2]; #puts mmm.to_s
      mmm=mmm.sort{|a,b| a<=>b}
      mmm.delete_at(3); mmm.delete_at(0)

      dy1=(ss*mmm.first-ss*xx1+yy1)-(s*mmm.first-s*x1+y1)
      dy2=(ss*mmm.last-ss*xx2+yy2)-(s*mmm.last-s*x2+y2)
      puts "---"
      puts "x left=#{mmm.first}, x right=#{mmm.last}"
      puts "LINE y left=#{ss*mmm.first-ss*xx1+yy1}, POLY y left=#{s*mmm.first-s*x1+y1}"
      puts "LINE: y right=#{ss*mmm.last-ss*xx2+yy2}, POLY y right=#{s*mmm.last-s*x2+y2}"
      
      #puts mmm.to_s
      puts dy1, dy2
      if sgn(dy1)!=sgn(dy2)
        puts "Intersection detected!"
        @detects<<idx
      end;  
    end;  
  end;

  def findIntersections(poly, line)
    xx1=line.first[:x]; yy1=line.first[:y];xx2=line.last[:x]; yy2=line.last[:y]; ss=(yy2-yy1).fdiv(xx2-xx1)
    puts "ss=#{ss}"
    @poly.each_with_index do |p, idx|
      next if idx+1==@poly.size
      x1=p[:x]; y1=p[:y]; x2=poly[idx+1][:x]; y2=poly[idx+1][:y]
      s=(y2-y1).fdiv(x2-x1)

      puts "xx1=#{xx1} xx2=#{xx2} x1=#{x1} x2=#{x2}"
      next unless ([x1,x2].min<=[xx1,xx2].max) && ([xx1,xx2].min<=[x1,x2].max)
      
      mmm=[xx1,xx2,x1,x2]; #puts mmm.to_s
      mmm=mmm.sort{|a,b| a<=>b}
      mmm.delete_at(3); mmm.delete_at(0)
      puts "N=#{idx+1}"
      puts "mmm: x left=#{mmm.first}, x right=#{mmm.last}"
      
      ix=(s*x1-y1-ss*xx1+yy1).fdiv(s-ss);
      puts "ix=#{ix}" 
      iy=s*ix-s*x1+y1;
      
      d=distance({x:ix, y:iy},@line.first)
      @i<<{x:ix, y:iy, d:d} if ix.between?(mmm.first, mmm.last)      
      puts @i
      
      @hit=@i.sort{|a,b| a[:d]<=>b[:d]}.first
    end;
    @hit
  end;  
  
  def distance(p1,p2) #hash hash
    d=Math.sqrt((p1[:x]-p2[:x])*(p1[:x]-p2[:x])+(p1[:y]-p2[:y])*(p1[:y]-p2[:y]))
  end
  
  def needs_cursor?
    true
  end 
  
  def button_down(id)
		if id==Gosu::KbEscape
      close
    elsif id==Gosu::KbSpace
      shoot;
    end;
  end;  
  
  def update
    now=Gosu.milliseconds;
    if (now-(@last_update||=0)).to_f<FRAME_DELAY
      #puts now-@last_update
      return
    end;
    @shells.select{|s| s.moving==true}.each do |sh|
      line=[]
      line<<{x:sh.x, y:sh.y}   
      #puts "SHOOT LINE1: #{line}"
      sh.update;
      line<<{x:sh.x, y:sh.y} 
      #puts "SHOOT LINE2: #{line}"
      if !findIntersections(@poly, line).nil?
        sh.moving=false;
      end
    end
    @shells=@shells.reject{|sh| sh.x>self.width || sh.x<0 || sh.y>self.height || sh.y<0}
    @last_update=now
  end

  def draw
    @poly.each_with_index do |p,idx|
      next if idx+1==@poly.size
      if @detects.include?(idx) 
        cc=Gosu::Color::RED
      else
        cc=Gosu::Color::WHITE
      end
      Gosu.draw_line(p[:x],p[:y], cc, @poly[idx+1][:x], @poly[idx+1][:y],cc);
    end;  
    Gosu.draw_line(@line.first[:x],@line.first[:y], Gosu::Color::GREEN, @line.last[:x], @line.last[:y],Gosu::Color::GREEN);
  
    if !@i.nil? && @i.size>0
      #puts @i
      @i.each do |p|
        draw_quad(p[:x]-3,p[:y]-3,Gosu::Color::YELLOW, p[:x]+3,p[:y]-3,Gosu::Color::YELLOW, p[:x]+3,p[:y]+3,Gosu::Color::YELLOW, p[:x]-3,p[:y]+3, Gosu::Color::YELLOW,1)
      end
    end;
  
    if !@hit.nil?
      draw_quad(@hit[:x]-5,@hit[:y]-5,Gosu::Color::RED, @hit[:x]+5,@hit[:y]-5,Gosu::Color::RED, @hit[:x]+5,@hit[:y]+5,Gosu::Color::RED, @hit[:x]-5,@hit[:y]+5, Gosu::Color::RED,1)
      
    end;
    
    @shells.select{|s| s.moving==true }.each do |sh|
      sh.draw;
    end
  end;
  
  def shoot 
    @shells<<Shell.new
    puts "PEW!"
  end
end;

class Shell
  attr_accessor :speed, :x, :y, :angle, :moving
  def initialize
    @x=200; @y=50; @speed=10; @angle=160;
    @moving=true;
  end
  
  def update    
    @x=@x+@speed*Math::sin(@angle*Math::PI.fdiv(180));
    @y=@y-@speed*Math::cos(@angle *Math::PI.fdiv(180));
  end
  
  def draw
    Gosu.draw_quad(@x-5,@y-5,Gosu::Color::GREEN, @x+5,@y-5,Gosu::Color::GREEN, @x+5,@y+5,Gosu::Color::GREEN, @x-5,@y+5, Gosu::Color::GREEN,10)      
  end
end

g=GameWindow.new
g.show