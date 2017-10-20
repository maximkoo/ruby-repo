require './utils'
p1=[{:x=>83.25, :y=>480.0}, {:x=>111.75, :y=>480.0}, {:x=>124.25, :y=>498.5}, {:x=>115.75, :y=>516.0}, {:x=>105.75, :y=>514.0}, {:x=>89.25, :y=>519.5}, {:x=>75.75, :y=>504.5}, {:x=>83.25, :y=>480.0}]
p2=[{:x=>100.0, :y=>500.0}, {:x=>100.0, :y=>520.0}, {:x=>100.0, :y=>500.0}]
puts Utils.polygons_intersect?(p2, p1)
res=Utils.polygons_intersections(p2, p1)
puts res

class C1
end;

class C2<C1
end;

d=C2.new
puts d.class.ancestors
