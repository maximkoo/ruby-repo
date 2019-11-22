class ObjectPool
    attr_accessor :objects
    def initialize
        @objects=[]
        #@map_objects=[]
        getMapObjects
    end;

    def getMapObjects
        $map.layers.object.each do |object_layer|
            object_layer.data["objects"].each do |obj|
                #puts obj.to_s
                @objects<<MapObject.new(self, obj["x"],obj["y"]) do |mo|
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

    # def objectsByPoint(x,y)
    #     arr=@obstacles+@ladders;
    #     res=[]
    #     arr.each do |a| 
    #         if (x.between?(a.x1,a.x2-1) && y.between?(a.y1,a.y2-1)) 
    #             res<<a.rectangle_type;
    #         end;  
    #     end;  
    #     res
    # end;

    def objectsByPoint(x,y)
        res=[]
        @objects.each do |obj|
            if (x.between?(obj.x1,obj.x2-1) && y.between?(obj.y1,obj.y2-1)) 
                #begin
                    res<<obj.type if !obj.type.nil?;
                #rescue NameError => e
                #    puts obj.class
                #end;    
            end;    
            res
        end;
    end;        
end;    