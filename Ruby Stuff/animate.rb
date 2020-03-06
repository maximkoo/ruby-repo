model=Sketchup.active_model
entities=model.active_entities
h=60
s2=50
pts=[]
pts<<[-s2,-s2,h]
pts<<[s2,-s2,h]
pts<<[s2,s2,h]
pts<<[-s2,s2,h]

off=75
ptss=[]
ptss[0]=pts.map{|x|[x[0]-off,x[1]-off,x[2]]}
ptss[1]=pts.map{|x|[x[0]-off,x[1]+off,x[2]]}
ptss[2]=pts.map{|x|[x[0]+off,x[1]+off,x[2]]}
ptss[3]=pts.map{|x|[x[0]+off,x[1]-off,x[2]]}

faces=[]
ptss.each do |p|
	faces<<entities.add_face(p)
	faces.last.back_material=Sketchup::Color.names[rand(140)]
	faces.last.pushpull(-h)
end

velos=[5,-5,5,-5]
heights=[h]*4

t=UI.start_timer(0.2, true) do
	faces.zip([0,1,2,3]).each do |face, n|
		begin
 			face.pushpull(velos[n])
 			heights[n]+=velos[n]
 			velos[n]=-velos[n] if (heights[n]>100)||(heights[n]<20)
 		rescue TypeError
 			UI.stop_timer(t)
 			puts "Stopped on error"
 		end;
 	end;
end;