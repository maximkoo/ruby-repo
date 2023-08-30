
WHITE=Gosu::Color.argb(0xff_ffffff)
RED=Gosu::Color.argb(0xff_ff0000)
class Bird  
  attr_accessor :master
  attr_accessor :x, :y, :v, :angle
  attr_accessor :expired
  attr_accessor :xi, :yi
  
  def initialize(master,x,y,v,a)
    @master=master
    @x,@y,@v,@angle=x,y,v,a
    #
    @neighbours=[]
    @color=WHITE   
    @xc,@yc=@x,@y 
  end;
  
  def sign(a)
    a<=>0
  end
  
  def draw_square(x,y,s,c,z=0)
    Gosu::draw_quad(x-s/2, y-s/2, c, x+s/2, y-s/2, c, x-s/2, y+s/2, c, x+s/2, y+s/2, c, z);
  end
  
  
  def update    
    @x=@x+v*Math::cos(@angle.degrees_to_radians)
    @y=@y+v*Math::sin(@angle.degrees_to_radians)
    
    @x=0 if @x>$window_width
    @y=0 if @y>$window_height
    @x=$window_width if @x<0
    @y=$window_height if @y<0
    #
    #@xi,@yi=@x,@y
    #    
    @neighbours.clear
    @color=WHITE
    @master.objects.each do |obj|
      dst=distance(self, obj)
      sdst=shortest_distance(self, obj)
      sdst1=shortest_distance1(self, obj)
      if obj!=self && obj.class.name=="Bird"
        if sdst1[0]<VISION
           @color=RED    
           #@neighbours<<{:obj=>obj,:dst=>dst, sdst=>:sdst}
           @neighbours<<{:obj=>obj,:dst=>dst, :sdst=>sdst1[0], :xi=>sdst1[1], :yi=>sdst1[2]} 
           # puts Gosu::angle(@x,@y, obj.x, obj.y)
           # puts Gosu::angle_diff(@angle, Gosu::angle(@x,@y, obj.x, obj.y))
           # puts @master.vector.cw(self, obj)  
           # puts           
        end
      end
      
      if obj.class.name=='Obstacle'
        if sdst<VISION
          #@color=obj.color
          c=@master.vector.cw(self, obj)
          #puts c
          if sign(c)>0 #-- Obstacle to the left
            steer_cw(1)
          else
            steer_ccw(1)
          end    
        end  
      end
    end
  end
  
  def distance(obj1, obj2)
    #Math::sqrt((obj1.x-obj2.x)*(obj1.x-obj2.x)+(obj1.y-obj2.y)*(obj1.y-obj2.y))
    Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y)
  end
  
  def shortest_distance(obj1, obj2)
    d1=Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y)
    d2=Gosu::distance(obj1.x, obj1.y, obj2.x-$window_width, obj2.y-$window_height)
    d3=Gosu::distance(obj1.x, obj1.y, obj2.x-$window_width, obj2.y)
    d4=Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y-$window_height)
    d5=Gosu::distance(obj1.x, obj1.y, obj2.x+$window_width, obj2.y+$window_height)
    d6=Gosu::distance(obj1.x, obj1.y, obj2.x+$window_width, obj2.y)
    d7=Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y+$window_height)
    #puts [d1,d2,d3,d4,d5,d6,d7].min    
    [d1,d2,d3,d4,d5,d6,d7].min    
  end
  
  def shortest_distance1(obj1, obj2)
    d=[]
    d<<[Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y),obj2.x, obj2.y] 
    d<<[Gosu::distance(obj1.x, obj1.y, obj2.x-$window_width, obj2.y-$window_height),obj2.x-$window_width, obj2.y-$window_height]
    d<<[Gosu::distance(obj1.x, obj1.y, obj2.x-$window_width, obj2.y),obj2.x-$window_width, obj2.y]
    d<<[Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y-$window_height),obj2.x, obj2.y-$window_height]
    d<<[Gosu::distance(obj1.x, obj1.y, obj2.x+$window_width, obj2.y+$window_height), obj2.x+$window_width, obj2.y+$window_height]
    d<<[Gosu::distance(obj1.x, obj1.y, obj2.x+$window_width, obj2.y),obj2.x+$window_width, obj2.y]
    d<<[Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y+$window_height),obj2.x, obj2.y+$window_height]
    #puts [d1,d2,d3,d4,d5,d6,d7].min    
    #[d1,d2,d3,d4,d5,d6,d7].min
    sd=d.min_by{|h| h[0] }    
  end
  def draw 
    x1=@x+BIRD_LENGTH*0.5*Math::cos(@angle.degrees_to_radians)
    y1=@y+BIRD_LENGTH*0.5*Math::sin(@angle.degrees_to_radians)
    
    x2=@x-BIRD_LENGTH*0.5*Math::cos(@angle.degrees_to_radians)+BIRD_WIDTH*Math::cos((@angle+90).degrees_to_radians)
    y2=@y-BIRD_LENGTH*0.5*Math::sin(@angle.degrees_to_radians)+BIRD_WIDTH*Math::sin((@angle+90).degrees_to_radians)
    
    x3=@x-BIRD_LENGTH*0.5*Math::cos(@angle.degrees_to_radians)+BIRD_WIDTH*Math::cos((@angle-90).degrees_to_radians)
    y3=@y-BIRD_LENGTH*0.5*Math::sin(@angle.degrees_to_radians)+BIRD_WIDTH*Math::sin((@angle-90).degrees_to_radians)   
    
    Gosu.draw_triangle(x1, y1, @color, x2, y2, @color, x3, y3, @color, z=0);
    
    @neighbours.each do |obj|
      #Gosu::draw_line(self.xc, self.yc, @color, obj[:obj].xc, obj[:obj].yc, @color, 0)
      Gosu::draw_line(self.x, self.y, @color, obj[:xi], obj[:yi], @color, 0)      
    end
    
    
    puts "This is Bird. @neighbours.size=#{@neighbours.size}"
    
    @neighbours_and_me=[]
    @neighbours.each {|x| @neighbours_and_me<<x}
    @neighbours_and_me<<{:obj=>self,:dst=>0, :sdst=>0, :xi=>@x, :yi=>@y}
           
    avgV=@master.vector.sum_neighbours(@neighbours_and_me)
    # puts "This is Bird again. @neighbours.size=#{@neighbours.size}"
    #puts 'avgV='
    #puts avgV
    
    avgP=@master.vector.mid_neighbours(@neighbours_and_me);    
    #puts "size=#{@neighbours.size}"
    #puts 'avgP='
    #puts avgP
    draw_square(avgP[:x],avgP[:y],2,Gosu::Color::YELLOW,1)
    avgA=Gosu.angle(avgP[:x],avgP[:y], avgP[:x]+avgV[:dx],avgP[:y]+avgV[:dy])
    #puts avgA
    Gosu::draw_line(avgP[:x],avgP[:y], Gosu::Color::YELLOW, avgP[:x]+SCALE*Math.cos(avgA.degrees_to_radians),avgP[:y]+SCALE*Math.sin(avgA.degrees_to_radians),Gosu::Color::YELLOW,1)
    #
    if @neighbours.size>0
      if Gosu.angle_diff(@angle, avgA)>0
        steer_cw(0.25)
      end;
      if Gosu.angle_diff(@angle, avgA)<0
        steer_ccw(0.25)  
      end
    end
    #Gosu::draw_line(self.x, self.y, Gosu::Color::CYAN, @x+Gosu.offset_x(@angle+90, @v)*SCALE,@y+Gosu.offset_y(@angle+90, @v)*SCALE,Gosu::Color::CYAN, z=0)
    #Gosu::draw_line(self.x, self.y, Gosu::Color::GRAY, @x+Gosu.offset_x(@angle+90, @v)*SCALE,@y,Gosu::Color::GRAY, z=0)     
    #Gosu::draw_line(self.x, self.y, Gosu::Color::GRAY, @x,@y+Gosu.offset_y(@angle+90, @v)*SCALE,Gosu::Color::GRAY, z=0)
  end
  

  def steer_cw(a=1)
    @angle+=a
  end
  
  
  def steer_ccw(a=1)
    @angle-=a
  end
end;