require 'inifile'
class CopyRaw
	def initialize

		ini = IniFile.load('path.ini')
		ini.each_section do |section|
  			puts "from path is #{ini[section]['from']}"
  			puts "to path is #{ini[section]['to']}"  			
		end
		@from=ini["paths"]["from"]
		@to=ini["paths"]["to"]
		m1;
	end;

	def m1
		begin
   			Dir.entries(@from).each do |f|
   				puts f if  f!='.' and f!='..' and f!='Octopress'
   			end;
		rescue Errno::EACCES
    		@log.puts("Access denied to: #{@path}");
   		end;
	end;	
end;

c=CopyRaw.new
