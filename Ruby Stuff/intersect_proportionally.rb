q1=[{x:50,y:50},{x:150,y:150}]
q2=[{x:150,y:50},{x:40,y:160}]

dx1=q1.last[:x]-q1.first[:x]
dx2=q2.last[:x]-q1.first[:x]
dx3=q2.first[:x]-q1.first[:x]

dy1=q1.last[:y]-q1.first[:y]
dy2=q2.last[:y]-q1.first[:y]
dy3=q2.first[:y]-q1.first[:y]

#v1=q1
#v2=[q1.first, q2.last]
#v3=[q1.first, q2.first]

#puts v1,v2,v3

s1=dx2*dy1-dx1*dy2
s2=dx3*dy1-dx1*dy3

d=s1.fdiv(s2)
puts d

