require 'gosu'
require './shell.rb'
require './explosion.rb'
require './meteor.rb'

class GameWindow<Gosu::Window
  FRAME_DELAY=100.fdiv(32);
  
  def initialize
    super(600,600,fullscreen=false)
    @animation=Gosu::Image.load_tiles('./exp2_0_50.png', 128/4,128/4);    
    #@q1=[{x:100,y:100},{x:150,y:185}]
    #@q2=[{x:150,y:100},{x:160,y:285}]
    #@q1=[{x:100,y:200},{x:200,y:200}]
    #@q2=[{x:100,y:140},{x:100,y:100}]
    #@q1=[{x:100,y:130},{x:100,y:150}]
    @q2=[{x:417,y:402},{x:474,y:402}]
    @q1=[{x:447,y:402},{x:444,y:411}]
    @i=[]
    @hits=[]
    @expls=[]
    @shells=[]
    @i<<Crossfinder.cross(@q1,@q2)   

    @poly=[]
    @poly<<{x:100,y:220};@poly<<{x:200,y:200};@poly<<{x:300,y:200};@poly<<{x:350,y:350};@poly<<{x:200,y:350};@poly<<{x:200,y:450};@poly<<{x:100,y:300}
    @poly<<@poly.first.clone;

    # @line=[{x:150,y:100},{x:225,y:585}]
    # crossPoly(poly:@poly, line:@line)
    @line=[{x:150,y:100},{x:430,y:585}]
    #crossPoly(poly:@poly, line:@line)

    @m1=Meteor.new do |m|
        m.x=400;
        m.y=400;
    end; 
  end;
  
  def sgn(n)
    n <=> 0
  end

  def crossPoly(poly:, line:)
    n=0
    (0..@poly.size-1-1).each do |idx|
        a=Crossfinder.cross([{x:poly[idx][:x],y:poly[idx][:y]},{x:poly[idx+1][:x],y:poly[idx+1][:y]}], line);
        @i<<a unless a.nil?
        n+=1
    end;   
    return n
  end;  

  def hitPoly(poly:, line:)
    a=nil;aa=nil;
    (0..@poly.size-1-1).each do |idx|
        a=Crossfinder.cross([{x:poly[idx][:x],y:poly[idx][:y]},{x:poly[idx+1][:x],y:poly[idx+1][:y]}], line);
        break if !a.nil?
    end;   
    return a
  end; 

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
      line<<{x:sh.x.round, y:sh.y.round}   
      #puts "SHOOT LINE1: #{line}"
      sh.update;
      line<<{x:sh.x.round, y:sh.y.round} 
      #puts "SHOOT LINE2: #{line}"
      #n=crossPoly(poly:@poly, line:line)
      #a=hitPoly(poly:@poly, line:line)
      #puts "POLY: #{@m1.poly}"
       a=hitPoly(poly:@m1.poly, line:line)
       #puts a
       if !a.nil?
         @hits<<a
         @expls<<Explosion.new(a[:x],a[:y], @animation)
         #puts "Explosion: #{@expls}"
         sh.moving=false;
       end;  
       # if n>0
       #   sh.moving=false;
       # end
    end
    @shells=@shells.reject{|sh| sh.x>self.width || sh.x<0 || sh.y>self.height || sh.y<0}
    @last_update=now

    @expls.each do |p|
        p.update;
    end;
    @expls.reject!{|p|p.out}
  end

  def draw
    [@q1,@q2].each do |q|
        Gosu.draw_line(q.first[:x],q.first[:y], Gosu::Color::GREEN, q.last[:x], q.last[:y],Gosu::Color::GREEN);
    end
    (0..@poly.size-1-1).each do |idx|
        Gosu.draw_line(@poly[idx][:x],@poly[idx][:y], Gosu::Color::CYAN, @poly[idx+1][:x], @poly[idx+1][:y],Gosu::Color::CYAN);
    end;    
    if @line
        Gosu.draw_line(@line.first[:x],@line.first[:y], Gosu::Color::RED, @line.last[:x], @line.last[:y],Gosu::Color::RED);
    end;    
    # @i.select{|pp|!pp.nil?}.each do |p|
    #     draw_quad(p[:x]-3,p[:y]-3,Gosu::Color::YELLOW, p[:x]+3,p[:y]-3,Gosu::Color::YELLOW, p[:x]+3,p[:y]+3,Gosu::Color::YELLOW, p[:x]-3,p[:y]+3, Gosu::Color::YELLOW,1)
    # end;

    # @hits.select{|pp|!pp.nil?}.each do |p|
    #     draw_quad(p[:x]-3,p[:y]-3,Gosu::Color::YELLOW, p[:x]+3,p[:y]-3,Gosu::Color::YELLOW, p[:x]+3,p[:y]+3,Gosu::Color::YELLOW, p[:x]-3,p[:y]+3, Gosu::Color::YELLOW,30)
    # end;

    @shells.select{|s| s.moving==true }.each do |sh|
      sh.draw;
    end

    @expls.each do |p|
         p.draw;
    end;

    @m1.draw;
  end; 

  def shoot 
    @shells<<Shell.new
    puts "PEW!"
  end
end;

class Crossfinder  
  def self.cross(p1,p2) ; # два массива, в каждом два хэша    
    p1,p2=p2,p1 if (p1.first[:x]-p1.last[:x]).abs>(p2.first[:x]-p2.last[:x]).abs #более вертикальные вперед
    x1=p1.first[:x]; y1=p1.first[:y].round; x2=p1.last[:x];y2=p1.last[:y].round
    xx1=p2.first[:x]; yy1=p2.first[:y].round; xx2=p2.last[:x];yy2=p2.last[:y].round
    return unless ([x1,x2].min<=[xx1,xx2].max) && ([xx1,xx2].min<=[x1,x2].max) && ([y1,y2].min<=[yy1,yy2].max) && ([yy1,yy2].min<=[y1,y2].max)
    #puts p1.to_s
    #puts p2.to_s

    dx=(x2-x1); dxx=(xx2-xx1);
    case 
        when dx==0 && dxx==0
            puts "Two verticals"
            return if x1!=xx1
            ix=x1
            if yy1.between?([y1,y2].min,[y1,y2].max)
                iy=yy1;
            elsif y1.between?([yy1,yy2].min,[yy1,yy2].max)
                iy=y1;
            end;                        
        when dx==0
            puts "One vertical"
            ss=(yy2-yy1).fdiv(xx2-xx1);
            ix=x1;
            iy=ss*ix-ss*xx1+yy1;
        else
            s=(y2-y1).fdiv(x2-x1);
            ss=(yy2-yy1).fdiv(xx2-xx1);

            ix=(s*x1-y1-ss*xx1+yy1).fdiv(s-ss);            
            iy=s*ix-s*x1+y1;
            #        puts "ix=#{ix}, iy=#{iy}"  
    end;              
    i={x:ix, y:iy} if ix.between?([x1,x2].min,[x1,x2].max) && ix.between?([xx1,xx2].min,[xx1,xx2].max) && iy.between?([y1,y2].min,[y1,y2].max) && iy.between?([yy1,yy2].min,[yy1,yy2].max)
    puts "And the cross is: #{i}";
    return i
  end;   
end;

g=GameWindow.new
g.show