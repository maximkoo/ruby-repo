require 'json'
require 'gosu'
require 'gosu_tiled'
require './images.rb'
require './movable_game_object.rb'
require './player.rb'
require './player_state.rb'
#require './collider.rb'
#require './animator.rb'
require './rectangle.rb'
 
  FRAME_DELAY=16 

class C1<Gosu::Window
  def initialize
    super 980,980, false
    @map = Gosu::Tiled.load_json(self, MAP_FILE)
    json=JSON.parse(File.read(MAP_FILE));
    @objectPool=ObjectPool.new(json);
    #$collider=Collider.new(json);
    @player=Player.new(@objectPool, 750,80);
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
    attr_accessor :objects, :obstacles, :ladders
    def initialize(json)
        @objects=[]        
        @obstacles=[]
        @ladders=[]
        getMapObjects(json)
    end;

    def getMapObjects(json)
    json['layers'].select{|x| x["name"]=="ObjectLayer1"}.each do |x|
      x['objects'].select{|xx| xx["visible"]==true }.each do |xx|
        case xx["type"]
          when OBSTACLE then qq=@obstacles#@grounds
          when LADDER then qq=@ladders
          else qq=nil
        end;  
        if qq
          qq<<Rectangle.new( xx["x"],xx["y"],xx["width"],xx["height"]);
          qq.last.rectangle_name=xx["name"];
          qq.last.rectangle_type=xx["type"];
        end;
      end;
    end;     
  end;

  def objectsByPoint(x,y)
    arr=@obstacles+@ladders;
    res=[]
    arr.each do |a| 
      if (x.between?(a.x1,a.x2) && y.between?(a.y1,a.y2)) 
        res<<a.rectangle_type;
      end;  
    end;  
    res
  end;

end;  

$g=C1.new
$g.show