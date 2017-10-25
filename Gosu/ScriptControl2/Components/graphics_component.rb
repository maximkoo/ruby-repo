require './Components/component.rb'
class GraphicsComponent<Component
    #attr_accessor :img
    def initialize(obj)
        super(obj)
        @img=@object.img
    end;  

    def draw
        @img.draw_rot(@object.x,@object.y,GRAPHICS_LAYER,@object.angle,0.5,0.5,SCALER, SCALER) if DRAW_GRAPHICS
    end;        
end;