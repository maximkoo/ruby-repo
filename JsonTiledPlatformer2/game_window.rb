require 'json'
require 'gosu'
require 'gosu_tiled'
require './images.rb'
require './movable_game_object.rb'
require './player.rb'
require './player_state.rb'
require './collider.rb'
#require './animator.rb'
require './rectangle.rb'
 
  FRAME_DELAY=16 

class C1<Gosu::Window
  def initialize
    super 980,980, false
    @map = Gosu::Tiled.load_json(self, MAP_FILE)
    json=JSON.parse(File.read(MAP_FILE));
    @objectPool=ObjectPool.new;
    $collider=Collider.new(json);
    @player=Player.new(@objectPool, 100,200);
  end
  
  def draw
    @map.draw(0,0)
    @player.draw;
  end
  
  def needs_cursor?
    true
  end

  def update
	  now=Gosu.milliseconds
	  return if (now-@last_update||=now) < FRAME_DELAY 
	  @objectPool.objects.map(&:update);
	  #@player.update;
	  @last_update=now;
  end;
end;  

class ObjectPool
    attr_accessor :objects
    def initialize
        @objects=[]
    end; 
end;  

C1.new.show