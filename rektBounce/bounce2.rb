require 'gosu';
require './rectangle'
require './collider'
FRAME_DELAY=24

class Bounce < Gosu::Window
    def initialize
      super(640, 400, false);

      @still=Rectangle.new(300,200,100,100, Gosu::Color::RED);
      @obj=[]

      @xS=6; @yS=-6;
      @go=true;
    end

    def needs_cursor?
    	true
  	end

    def update

    end;
    
    def draw

    end; 
end;    