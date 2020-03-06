class Ololo
	@x=1
end;	

a=[Ololo.new, Ololo.new, Ololo.new]
c=a.map{|x| x.clone} #клонируем вложенные объекты
puts a.object_id #24067104
puts c.object_id #24599568
puts a.first.object_id #24599616 --разные
puts c.first.object_id #24599556 --разные
