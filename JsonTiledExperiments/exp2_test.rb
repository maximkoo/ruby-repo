require "minitest/autorun"
require './exp2.rb'
require 'json'

class Exp2_test<Minitest::Test
	def setup
		map=JSON.parse(File.read('c:\Users\max\Ruby\JsonTiledPlatformer4.1\assets\maps\LongerMap.json'));
		@tm=TiledMap.new(map)
	end;
	
	def test_layers
		assert_equal(@tm.layers.size, 6);
	end;

	def test_tilesets
		assert_equal(@tm.tilesets.size, 6);
	end;
end;		
