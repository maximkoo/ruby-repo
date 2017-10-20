require './Components/component.rb'
class GraphicsComponent<Component
    #attr_accessor :img
    def initialize(obj)
        super(obj)
        #f=File.join("c:","Users","kopa","Documents","Ruby","Graphics","kenney_spaceShooterExtension","PNG","Sprites","Ships","spaceShips_001.png")
        #f='./spaceShips_001_50.png';
        @img=@object.img
        #@object.xCenter=@img.width.fdiv(2)
        #@object.yCenter=@img.height.fdiv(2)
        #puts @object.xCenter, @object.yCenter
    end;  

    def draw
        @img.draw_rot(@object.x,@object.y,GRAPHICS_LAYER,@object.angle,0.5,0.5,SCALER, SCALER) if DRAW_GRAPHICS
    end;        
end;