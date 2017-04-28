# 
# http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html
# 
require 'nokogiri'

#Создаем XML-ресурс для Nokogiri
a=''
a<<File.open('1.xml').read;
b=Nokogiri::XML(a)
#или вот так
doc = File.open("1.xml") { |f| Nokogiri::XML(f) }

puts b.xpath('//value') #вроде оператора extract в PLSQL, возвращает XML, 
							   #обрезаный до тэга

puts b.xpath('//value').class
b.xpath('//value').each do |x| # при этом он ещё и коллекция Nokogiri::XML::NodeSet
	puts x.content.strip!; #strip удаляет пробелы, потому что сами они не удаляются
end;

puts b.xpath('//value/@xxx') #значение атрибута ххх из всех тегов

