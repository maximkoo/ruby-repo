require 'mini_magick'
require './background.rb'
require './square.rb'
require './sidewindow.rb'
require './topwindow.rb'
require './manyvert.rb'
class Collager
	def initialize(args)
		@imgs=[]
		@brdSize=10
		return if args.size==1;
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
			#when 13 then TTwindow.new;
			when 21 then SideWindow.new;
			#when 22 then HakenKreuz.new;
			#when 31 then SmallSide.new;
				
			end;
		#Square.new.getRatios(@imgs,800);
		#SideWindow.new.getRatios(@imgs,800);
		ratios=matchClass.getRatios(@imgs,800, @brdSize);
		z=0
		@imgs.each do |i|
			i["ratio"]=ratios[z]
			i["reducedWidth"]=i["width"]*ratios[z]
			i["reducedHeight"]=i["height"]*ratios[z]
			z+=1
		end;
		#puts @imgs	
		bkgSize=matchClass.getBkgSize(@imgs, @brdSize);
		bkg=BackGround.new(bkgSize["width"],bkgSize["height"]).getBackGround
		geo=matchClass.getGeometry(@imgs, @brdSize);
		z=0
		@imgs.each do |i|
			i["geometry"]=geo[z]
			z+=1
		end;

		@imgs.each do |i|
			reducedImage=i["image"].resize("#{i["ratio"]*100}%")
			bkg=bkg.composite(i["image"]) do |c|
				c.compose "Over"    # OverCompositeOp
	  			c.geometry "#{i["geometry"]}"
			end;	
		end;

		bkg.write "collage_"+Time.now.strftime("%Y%m%d_%H%M%S")+".jpg"
		puts "Successfully saved"	
	end;
end;	

x=Collager.new(ARGV)