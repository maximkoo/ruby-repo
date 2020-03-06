entities=Sketchup.active_model.entities;
a=[]
entities.each do |x|
 a<<x if x.class==Sketchup::ConstructionLine;
end;
entities.erase_entities(a);