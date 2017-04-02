require 'tk'

class Xxx
def initialize
@root = TkRoot.new {
     title "Hello Tk!"; padx 5; pady 1
}

myicon = TkPhotoImage.new('file' => 'no.gif')
@root.iconphoto(myicon)

@cnv1=TkCanvas.new(@root){background 'gray'}.grid :sticky => 'nwes', :column => 0, :row => 0


TkGrid.columnconfigure(@root, 0, :weight=>10)
TkGrid.rowconfigure(@root, 0, :weight=>10)

@a=TkcImage.new(@cnv1, 100,100){image myicon}
@a.bind('1', proc{m1})
end;

def m1
	puts @a.cget("coords").to_s
	(1..10).each do |i|
	x=@a.cget("coords").first
		p=[x+5,100]
		@a.configure("coords"=>p);
		@root.update
		sleep(0.05)
	end;
	# sleep 0.01
	# @root.update
	# (1..10).each do |i|
	# x=@a.cget("coords").first
	# 	p=[x+5,100]
	# 	@a.configure("coords"=>p);
	# 	#sleep(0.05)
	# end;
end;

#https://www.ruby-forum.com/topic/148462
def m2 #способ гораздо проще
	(1..5).each do
		@a.move(20,20)
		@root.update
		sleep(0.01)
#@root.update
	end;
end;	

end;
x=Xxx.new;
Tk.mainloop