require 'nokogiri'
doc=Nokogiri::XML(File.open('level.xml'))
a=Hash.new
doc.xpath('//row').each do |r|
	k=r.xpath('@id').text.to_i
	a[k]=[]
	puts r.xpath('@id')
	r.xpath('pos').each do |p|
		v=p.xpath('@x').text
		puts p
		a[k]<<v.to_i
	end;	
end;	
puts a