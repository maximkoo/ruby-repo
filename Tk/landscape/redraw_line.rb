require 'tk'

class Aaa
def initialize
@root1 = TkRoot.new {title "reDraw"; padx 10; pady 10;}
@cnv1=TkCanvas.new(@root1){background 'white'}.grid :sticky => 'nwes', :column => 0, :row => 0
@on=true
end

def redraw(value)
	a=TkcLine.new(@cnv1, value,10,100+value,100){width 3; }
	if @on 
		a['fill']='red'
	else
		a['fill']='white'
	end 
	@on=!@on
end;

def isOn?
	@on
end;	
end; #class

ppp=Aaa.new
#x.redraw
v=10
p1=proc{ppp.redraw(v); 
		if ppp.isOn?
			v+=10; 
		end;	
		puts v}
tm = TkTimer.new(1000, -1, p1)
tm.start(0);
Tk.mainloop