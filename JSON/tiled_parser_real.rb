require 'json'

class C1
	jsonFile=File.read(File.join(File.dirname(__FILE__),'tiled1a.json'))
	obj=JSON.parse(jsonFile)

	objects=[]

	obj['layers'].each do |x| 
		puts x['name']
		if x["type"]=='objectgroup'
			x['objects'].each do |ob|
				puts "#{9.chr}Object: id=#{ob['id']}, name=#{ob['name']}"
				objects<<ob
			end;	
		end;	
	end;	
puts "---"
puts objects
end;