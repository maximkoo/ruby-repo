require 'gosu'

class Tutorial < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Tutorial Game"
   @background_image = Gosu::Image.new("walk-cycle-poses.jpg", :tileable => true)
  end

  def update
    # ...
  end

  def draw
    @background_image.draw(10,10,0)
  end

  def button_down(id)
    close if id==Gosu::KbEscape;
  end;
end

x=Tutorial.new
x.show