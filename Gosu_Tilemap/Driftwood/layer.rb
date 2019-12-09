class AbstractLayer
    def initialize(master, data)
        @master=master;
        #@id=data["id"]
        @data=data["data"]
        @name=data["name"]
        @type=data["type"]
        @visible=data["visible"]          
        @x,@y=data["x"],data["y"]
        @width,@height=data["width"],data["height"]
        master.layers<<self;
    end;    
end;

class TileLayer<AbstractLayer
    def initialize(master,data)
        super(master,data)
        @data=data["data"]
        puts "Layer created"
        @iter=0
    end;    

    def draw
        x,y=@x,@y;      # the layer offset      
        (0..@height-1).each do |i|
            (0..@width-1).each do |j|
                gid=@data[i*@width+j]
                if gid!=0 
                    tile=@master.getTileByGid(gid);
                    tile.draw(j*tile.width, i*tile.height,10,1,1)
                end;    
            end;    
        end;    
    end;
end;

class ObjectLayer<AbstractLayer
    attr_accessor :objects
    def initialize(master,data)
        super(master,data)
        #@objects=data["objects"]
    end;

    def draw

    end;  
end; 