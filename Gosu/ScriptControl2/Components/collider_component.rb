require './Components/component.rb'
class ColliderComponent<Component
	def initialize(obj)
        super(obj)
    end;
    
    def update
      res=nil;
      @object.object_pool.nearby(@object).each do |obj|
        next if obj==@object || obj==@object.source
         #puts "Object nearby detected: #{obj}"
         #puts "Object=#{@object}, obj=#{obj}"
         #puts obj.poly
         #puts "laser"
         #puts @object.poly
        if Utils.polygons_intersect?(@object.poly, obj.poly)
          #puts "HIT DETECTED!!!!"
          res=Utils.polygons_intersections(@object.poly, obj.poly)
          #puts res.to_s
           res.each {|r| r[:another_object]=obj} 
          #@object.expired=true;
        end;  
      end
      @object.hits=res
    end;
end;        
