require 'tk'
require './c1.rb'
#require './c2.rb'
class C0
	def initialize
		root=TkRoot.new{title "00000"; padx 1; pady 1;}
		x=(TkWinfo.screenwidth(root))/2
		y=(TkWinfo.screenheight(root))/2
		root['geometry']="100x100+#{x-50}+#{y-50}";		

		TkButton.new(root, :text=>"Button1", :command=>proc{newWin(root)}).pack
		Tk.mainloop
	end;

	def newWin(r)
		r.withdraw;
		c1=C1.new(r)
	end;	
end;
C0.new
