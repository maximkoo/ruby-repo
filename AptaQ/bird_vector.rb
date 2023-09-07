class BirdVector
  #attr_accessor :dx, :dy

def sum2(obj1, obj2)
  dx=Gosu::offset_x(obj1.angle, obj1.v)+Gosu.offset_x(obj2.angle, obj2.v);
  dy=Gosu::offset_y(obj1.angle, obj1.v)+Gosu.offset_y(obj2.angle, obj2.v);
  {dx:dx, dy:dy}  
end

def sum_neighbours(args)  
  #puts "This is sum_neighbours. Size=#{args.size}"
  if args.size!=0   
    dx=args.inject(0){|sum, obj| sum+Gosu.offset_x(obj[:obj].angle, obj[:obj].v)}
    dy=args.inject(0){|sum, obj| sum+Gosu.offset_y(obj[:obj].angle, obj[:obj].v)}
    {dx:dx.round(5), dy:dy.round(5)}
  end
end

def mid_neighbours(args)
  #puts "This is mid_neighbours. Size=#{args.size}"
  if args.size!=0       
    mx=args.inject(0){|sum, obj| sum+obj[:xi]}.fdiv(args.size)
    my=args.inject(0){|sum, obj| sum+obj[:yi]}.fdiv(args.size)
    {x:mx, y:my}
  end
end



def skew_product(obj1, obj2)
   
end

def sign(a)
  a<=>0
end

def cw(obj1, obj2) # Above zero = obj2 is to the left, below zero = obj2 is to the right
  a=Gosu::angle(obj1.x,obj1.y, obj2.x, obj2.y)
  b=Gosu::angle_diff(obj1.angle-90, a)
  sign(b)
end

def cwxy(obj1, x, y)
  a=Gosu::angle(obj1.x,obj1.y, x, y)
  b=Gosu::angle_diff(obj1.angle-90, a)
  sign(b)
end
end;



