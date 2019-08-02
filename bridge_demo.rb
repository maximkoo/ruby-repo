require './bridge_real.rb'
class BridgeDemo<Gosu::Window
	def initialize
		 super(640, 400, false);
	end;
end;	

$b=BridgeDemo.new;
$b.show;
