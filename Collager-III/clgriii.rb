require 'mini_magick'
require './background.rb'
require './square.rb'
require './sidewindow.rb'
require './topwindow.rb'
require './manyvert.rb'
require './hakenkreuz.rb'
class Collager
	def initialize(args)
		@imgs=[]
		@brdSize=10
		#@mods=args.select{|i| /^--/===i}
		#args=args-@mods
		a=[]; @mods=[];
		args.each_with_index do |val, indx|	
			if /^\.|\.jpg$|.png$/===val
				a<<val
			end;
			if /^--/===val
				if ["--last","--right","--down"].include? val
					@mods<<val
				end;
				if ["--latest"].include? val	
					@mods<<val
					@mods<<args[indx+1]
				end;	
			end;	
		end;	
		#puts a
		puts @mods
		
		if !@mods.nil? && @mods.include?("--last")
			x=@mods.index("--last")
		 	args=Dir['*.jpg'].sort_by{|f| File.mtime(f)}.last(1)
		else args=a
		end;

		if !@mods.nil? && @mods.include?("--latest")
			x=@mods.index("--latest")
		 	args=Dir['*.jpg'].sort_by{|f| File.mtime(f)}.last(@mods[x+1].to_i)
		else args=a
		end;	

		return if args.size<=1;
		args.each do |i|
			a=MiniMagick::Image.open(i);
			h=Hash.new;
			h["image"]=a;
			h["filename"]=i
			h["height"]=a.height
			h["width"]=a.width
			if a.width>a.height;
				h["orientation"]="Horizontal";  
			else 
				h["orientation"]="Vertical";
			end; 			
			puts h["orientation"]			
			@imgs.push(h)
		end;	

		@totalH=@imgs.select{|j|j["orientation"]=="Horizontal"}.size	
		@totalV=@imgs.select{|j|j["orientation"]=="Vertical"}.size
		puts "Total horizontal: #{@totalH}, total vertical: #{@totalV}"
	

		matchClass=case (@totalH*10+@totalV)
			when 2 then ManyVert.new
			when 3 then ManyVert.new
			when 4 then ManyVert.new
			#when 20 then ManyVert.new{|t| t.brdX=1; t.brdY=0}
			#when 30 then nil; #Makes no sense
			when 40 then Square.new;

			#when 11 then Forel.new;	
			when 12 then TopWindow.new;
			when 13 then TopWindow.new;
			when 14 then TopWindow.new;
			when 21 then SideWindow.new;
			when 22 then HakenKreuz.new;
			when 31 then SideWindow.new;
			else puts "*** NO COMBINATION ! ***"	
			end;
		#Square.new.getRatios(@imgs,800);
		#SideWindow.new.getRatios(@imgs,800);
		@imgs=matchClass.getRatios(@imgs,800, @brdSize);
		#z=0
		@imgs.each do |i|
			i["reducedWidth"]=i["width"]*i["ratio"]
			i["reducedHeight"]=i["height"]*i["ratio"]
			puts "--- #{i["reducedWidth"]} --- #{i["reducedHeight"]}"
		end;
		#puts @imgs	
		bkgSize=matchClass.getBkgSize(@imgs);
		bkg=BackGround.new(bkgSize["width"],bkgSize["height"]).getBackGround
		@imgs=matchClass.getGeometry(@imgs, @mods);		

		@imgs.each do |i|
			reducedImage=i["image"].resize("#{i["ratio"]*100}%")
			bkg=bkg.composite(i["image"]) do |c|
				c.compose "Over"    # OverCompositeOp
	  			c.geometry "#{i["geometry"]}"
			end;	
		end;

		newFileName="collage_"+Time.now.strftime("%Y%m%d_%H%M%S")+".jpg"
		tagLine="{% img center /images/#{Time.now.year}/#{newFileName} %}"
		bkg.write newFileName
		FileUtils.copy(newFileName, File.join("c:","Users","Maxim","Documents","Octopress","source","images","#{Time.now.year}"));
		File.write("tags.txt",tagLine);
		puts "Successfully saved"	
	end;
end;	

x=Collager.new(ARGV)