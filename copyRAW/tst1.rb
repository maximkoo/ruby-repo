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
end;

class DirectoryCopier
	@a=0
	def self.a=(x)
		@a=x
	end;	
	def self.a
		@a
	end;
		
	def initialize(from, to)
		@from,@to=from, to
		processFiles
		self.class.a+=1
		#puts "Inlet dirs: #{self.class.a}"
	end;	
	
	def processFiles
		begin
			#FileUtils.cd(@from)
			# Dir.entries(@from).each do |f|
   # 				puts f
   # 			end;	
			puts "... entering directory #{@from}"			
   			Dir.entries(@from).each do |f|
   				next if ['.','..'].include?(f)

   				if File.file?(@from+"\\"+f)
   					if File.exists?(@to+"\\"+f)
						puts "File #{@to+"\\"+f} exists!"
   					else
   						FileUtils.copy(@from+"\\"+f,@to+"\\"+f)
   						puts "File #{@to+"\\"+f} copied!"
   					end;	
   					
   				end;
   				if File.directory?(@from+"\\"+f)
   					if File.exists?(@to+"\\"+f)
   						puts "Directory #{@to+"\\"+f} exists!"
   					else	
   						FileUtils.mkdir(@to+"\\"+f)
   						puts "Directory #{@to+"\\"+f} created!"
   					end;	
   					FileUtils.cd(@to+"\\"+f) do
   						DirectoryCopier.new(@from+"\\"+f, @to+"\\"+f)
   					end;	
   				end;   					
   			end;
   		rescue Errno::EACCES
    	@log.puts("Access denied to: #{@path}");
    	end;
    end;
end;

c=CopyRaw.new;