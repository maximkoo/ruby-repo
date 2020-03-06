require 'nokogiri'
doc=Nokogiri::XML('level.xml')
doc.xpath('/row').each do |r|
	puts r
end;