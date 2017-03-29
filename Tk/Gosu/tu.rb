require 'gosu'

class Tutorial < Gosu::Window
  def initialize
    super 640, 480, true
    self.caption = "Tutorial Game"
   #@background_image = Gosu::Image.new("ticket.jpg", :tileable => true)
  end

  def update
    # ...
  end

  def draw
    # ...
  end
end

x=Tutorial.new
x.show