require 'gosu'
class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    c=Gosu::Sample.new('pop.ogg')
    c.play(2,1,false)
  end;
end;    


window = GameWindow.new
window.show