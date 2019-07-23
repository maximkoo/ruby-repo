require 'inifile'
require 'fileutils'
class CopyRaw
#	include FileUtils
	def initialize
		ini = IniFile.load('path.ini')
		# ini.each_section do |section|
  # 			puts "from path is #{ini[section]['from']}"
  # 			puts "to path is #{ini[section]['to']}"  			
		# end
		@from=ini["paths"]["from"]
		@to=ini["paths"]["to"]
		puts
		#m1;
		DirectoryCopier.new(@from, @to)
	end;

	def m1
		#DirectoryCopier.new(@from, @to)
	end;	

	def self.getFolderNameByDate(f)
		x=File.new(f).ctime;
		puts x
		puts x.strftime("%Y-%m-%d");
		x.strftime("%Y-%m-%d");
	end;	
end;

class DirectoryCopier
	def initialize(from, to)
		@from,@to=from, to
		@currentTo=@to
		processFiles
	end;	
	
	def processFiles
		begin
			puts "... entering directory #{@from}"			
   			Dir.entries(@from).each do |f|
   				next if ['.','..'].include?(f)

   				if File.file?(@from+"\\"+f) 
   					dateFolder=CopyRaw.getFolderNameByDate(@from+"\\"+f)
   					if !Dir.exist?(@to+"\\"+dateFolder)
   						FileUtils.mkdir(@to+"\\"+dateFolder)
   					end;	

   					@currentTo=@to+"\\"+dateFolder 
   					
   					if File.exists?(@currentTo+"\\"+f)
						puts "File #{@currentTo+"\\"+f} exists!"
   					else
   						FileUtils.copy(@from+"\\"+f,@currentTo+"\\"+f, :preserve=>true)
   						puts "File #{@currentTo+"\\"+f} copied!"
   					end;   					
   				end;

   				if File.directory?(@from+"\\"+f)
   						DirectoryCopier.new(@from+"\\"+f, @to)
   				end;   					
   			end;
   		rescue Errno::EACCES
    	@log.puts("Access denied to: #{@path}");
    	end;
    end;
end;

c=CopyRaw.new;