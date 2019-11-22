require 'gosu'
require 'gosu_tiled'
require './bin/constants.rb'
require './Override/layer_override.rb'
require './bin/movable_game_object.rb'
require './bin/map_object.rb'
require './bin/object_pool.rb'

class GameWindow<Gosu::Window
  	def initialize
	    super 980,980, false
	    $map = Gosu::Tiled.load_json(self, MAP_FILE)
	    
	    $map_width=$map.width
	    $map_height=$map_height

	    $viewport_x=0
	    $viewport_y=0
	    $viewport_width=980
	    $viewport_height=980
	    @viewport_offset_x=0
	    @viewport_offset_y=0
  	end;

  	def draw
      $map.draw(@viewport_offset_x,@viewport_offset_y)
  	end
end;

$g=GameWindow.new
$g.show


