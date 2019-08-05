require 'json'
require 'gosu'
require 'gosu_tiled'
require './player.rb'
require './collider.rb'
require './rectangle.rb'

  MAP_FILE = File.join(File.dirname(__FILE__), 'ArtPackMap70.json')
  FRAME_DELAY=16 

class C1<Gosu::Window
  def initialize
    #super(3840, 3840, false)
    #super(896,576)
    super 980,980, false
    @map = Gosu::Tiled.load_json(self, MAP_FILE)
    #super @map.width, @map.height, false
    @x = @y = 0
    puts @map.width, @map.height;
    $collider=Collider.new;
    @player=Player.new(100,323);
     end
  
  def draw
    @map.draw(@x,@y)
    @player.draw;
  end
  
   def needs_cursor?
    true
  end

  def update
	now=Gosu.milliseconds
	return if (now-@last_update||=now) < FRAME_DELAY 
	#@objectPool.objects.map(&:update);

	@player.update;

	@last_update=now;
end;
end;  

C1.new.show