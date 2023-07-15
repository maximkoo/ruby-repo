#int d = Math.abs(a - b) % 360; 
#int r = d > 180 ? 360 - d : d;

#//calculate sign 
#int sign = (a - b >= 0 && a - b <= 180) || (a - b <=-180 && a- b>= -360) ? 1 : -1; 
#r *= sign;

a=0;
b=700;

# if (a < 0) then a = 360 - ((-a) % 360)
# else a = a % 360;
# end;
# if (b < 0) then b = 360 - ((-b) % 360)
# else b = b % 360;
# end;

a= (a<0)? 360 - ((-a) % 360) : a % 360;
b= (b<0)? 360 - ((-b) % 360) : b % 360;

d=((a-b)%360).abs
r= (d>180) ? 360-d : d
sign=(a - b >= 0 && a - b <= 180) || (a - b <=-180 && a- b>= -360) ? -1 : 1; 
r*=sign

puts "a=#{a}, b=#{b}, d=#{d}, r=#{r}"