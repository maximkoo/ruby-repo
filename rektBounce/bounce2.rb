require 'gosu';
require './rectangle'
require './collider'
require './rectangleFactory'
FRAME_DELAY=24

class Bounce < Gosu::Window
    def initialize
      super(640, 400, false);

      @fact=RectangleFactory.new;
      @still=Rectangle.new(200,200,100,100, Gosu::Color::RED);
      @obj=[]

      #@xS=6; @yS=6;
      @go=true;
      @cycles=0;

       # @obj<<Rectangle.new(0,0,20,20, Gosu::Color::YELLOW)
    end

    def needs_cursor?
    	true
  	end

    def update
      now=Gosu.milliseconds
      return if (now-@last_update||=now) < FRAME_DELAY 
      return if !@go
      if @cycles%20==0
        # @obj<<Rectangle.new(0,0,20,20, Gosu::Color::YELLOW)
        @obj<<@fact.generate;
        @cycles=1 if @cycles>1000
      end;  

      @obj.each do |r|
        r.move;
        if Collider.intersect?(r,@still)
          contact=Collider.contact(r,@still);
          r.x=contact[:contactX];
          r.y=contact[:contactY];
        
          if contact[:contactType]=~/horizontal/
            r.yS=-r.yS
          elsif contact[:contactType]=~/vertical/
            r.xS=-r.xS
          end;
        end; 
        @obj.delete(r) if r.x<0 || r.y<0 || r.y>600 || r.x>600 
      end;
      # obj.each do |b|
      #   b.move();
      # end;  

      @cycles+=1;
      @last_update=now; 
    end;
    
    def draw
      @still.draw;
      @obj.each do |r|
        r.draw();
      end;
    end;   
end;    

$b=Bounce.new;
$b.show;
