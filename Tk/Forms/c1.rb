require 'tk'
require 'mini_magick'
class C1
	def initialize(r)
		@win=TkToplevel.new{title "22222"; padx 1; pady 1}
		
		x=(TkWinfo.screenwidth(@win))/2
		y=(TkWinfo.screenheight(@win))/2
		@win['geometry']="100x100+#{x+50}+#{y+50}";

		TkButton.new(@win, :text=>"Button2", :command=>proc{backWin(r)}).pack
		TkButton.new(@win, :text=>"Choose file", :command=>proc{openFile}).pack
		@flabel=TkLabel.new(@win, :text=>"No file").pack
	end;

	def backWin(r)
		@win.destroy
		r.deiconify
	end;	

	def openFile
		fname=Tk::getOpenFile
		fbase=File.basename(fname)
		@flabel['text']=fbase;
		@img=MiniMagick::Image.open(fname);
		cSize=@img.dimensions.min;
		offx=(@img.dimensions.first-cSize)/2
		offy=(@img.dimensions.last-cSize)/2
		@img.combine_options do |iii|
			iii.crop("#{cSize}x#{cSize}+#{offx}+#{offy}")
			iii.resize("500x500")
		end;
		dname=File.basename(fname, File.extname(fname));
		 Dir.mkdir(dname) unless File.exists?(dname)
		 # @img.format("gif")
		 # @img.write("#{dname}/#{dname}.gif");
		 # f="#{dname}/#{dname}.gif"
		 
		 @img.write("#{dname}/#{dname}.jpg");
		 f="#{dname}/#{dname}.jpg"
		 crash(f, dname)
	end;

	def crash(fname, dname)
		totalX=totalY=500
		pieces=4
		xx=totalX.fdiv(pieces)
		yy=totalY.fdiv(pieces)
		(1..pieces).each do |i|
			(1..pieces).each do |j|
				@img=MiniMagick::Image.open(fname);
				geo="#{xx}x#{yy}+#{(j-1)*yy}+#{(i-1)*xx}"
				img=@img.crop (geo);
				  img.format("gif")
				fname1="./#{dname}/#{i}#{j}.gif"
				img.write(fname1);
			end;	
		end;
	end;		
end;
