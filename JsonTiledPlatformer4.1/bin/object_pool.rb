class ObjectPool
    attr_accessor :map_objects, :objects
    def initialize(json)
        @objects=[]
        @map_objects=[]
        getMapObjects(json)
    end;

    def getMapObjects
        $map.layers.object.each do |object_layer|
            object_layer.data["objects"].each do |obj|
                puts obj.to_s
                @map_objects<<MapObject.new(obj["x"],obj["y"]) do |mo|
                    mo.w=obj["width"];
                    mo.h=obj["height"] 
                    mo.name=obj["name"] 
                    mo.type=obj["type"]  
                    mo.xS=0
                    mo.yS=0;  
                    mo.layer=object_layer.data["name"]     
                    #puts mo.inspect
                end;  
            end;  
        end;
    end;
end;    