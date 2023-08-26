require 'gosu'
require './object_pool.rb'
FRAME_DELAY=16
BIRD_LENGTH=15
BIRD_WIDTH=5
VELOCITY=1
class GameWindow<Gosu::Window
  SCREEN_WIDTH=Gosu.screen_width;
  SCREEN_HEIGHT=Gosu.screen_height;
  def initialize
    $window_width=600
    $window_height=600;
    super($window_width,$window_height, true)
    @objectPool=ObjectPool.new        
  end;

  def needs_cursor?
      true
    end 
  
    def button_down(id)
      if id==Gosu::KbEscape
        close     
      end;
      if id==Gosu::KbRight
        @objectPool.steer_cw(5)     
      end;
      
      if id==Gosu::KbLeft
        @objectPool.steer_ccw(5)     
      end;
    end;

    def update
      now=Gosu.milliseconds
      return if (now-@last_update||=now) < FRAME_DELAY 
      @objectPool.objects.map(&:update);

      @objectPool.objects.reject!{|a| a.expired==true}  
      @last_update=now;
    end;

    def draw
      @objectPool.objects.map(&:draw)      
    end;
end;

$g=GameWindow.new
$g.show;    