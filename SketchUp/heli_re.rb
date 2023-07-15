model=Sketchup.active_model
entities=model.active_entities
faces=[]
angle_step=Math::PI/6
angle=0.to_f
r=100
hs=10
p=[]
(1..40).each do |s|
	pts1=[0,0,s*hs]
	pts2=[r*Math.sin(angle),r*Math.cos(angle),s*hs]
	pts3=[r*Math.sin(angle+angle_step),r*Math.cos(angle+angle_step),s*hs]
		
	p=[pts1, pts2, pts3]

	faces<<entities.add_face(p)
    faces.last.back_material=Sketchup::Color.names[rand(140)]    

    angle=angle+angle_step
    # puts "angle #{angle}"
    # puts p
    # puts
end;