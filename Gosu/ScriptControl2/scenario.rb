require 'Nokogiri'
class Scenario
	attr_reader :scenario1
	def initialize
		@scenario1=[]
		doc=File.open('./Scenarios/scenario1.xml') do |f|
				Nokogiri::XML(f)
		end;

		s={}
		doc.xpath('//object').each do |obj|
			#@scenario1<<{id:obj.xpath('@id').text.to_sym,x:obj.xpath('@x').text.to_i,y:obj.xpath('@y').text.to_i,angle:obj.xpath('@angle').text.to_i,type:obj.xpath('@type').text}
			s[:id]=obj.xpath('@id').text.to_sym
			s[:x]=obj.xpath('@x').text.to_i
			s[:y]=obj.xpath('@y').text.to_i
			s[:angle]=obj.xpath('@angle').text.to_i
			s[:type]=obj.xpath('@type').text
			#puts s	
			@scenario1<<s.clone;		
		end;

		#puts @scenario1;	
	end;
end;	