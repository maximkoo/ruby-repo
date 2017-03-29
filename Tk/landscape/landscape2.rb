require 'tk'

class Landscape
	def initialize
		@root1 = TkRoot.new {title "reDraw"; padx 10; pady 10;}
		@cnv1=TkCanvas.new(@root1){background 'white'}.grid :sticky => 'nwes', :column => 0, :row => 0
		@lbl1=TkLabel.new(@root1).grid :column => 0, :row => 1
		@cnv1['height']=500;
		@cnv1['width']=500;
		@points=[]
	end

	def initLand
		@points=[[0,100],[100,200],[150,150],[250,300],[350,100],[475,250]]
	end;

	def move(speed)
		while @points[1].first<0 #когда вторая точка (т.е. весь первый отрезок уходит за левый край экрана)
			@points.shift
		end	
		while @points.last.first<@cnv1['width']-20 #когда правый край ландшафта показался на экране
			@points<<[@points.last.first+Random.new.rand(200).round,Random.new.rand(200).round]
		end;	
		@points.size.times do |i|
			@points[i]=[@points[i].first-speed,@points[i].last]
			#print @points[i]
			#puts
		end	
		@lbl1['text']=@points.size
	end	

	def redraw(pcolor)
		#TkcLine.new(@cnv1,-100,100,100,100){fill 'red'; width 3}
		#TkcLine.new(@cnv1,0,120,100,120){fill 'red'; width 3}
		(@points.size-1).times do |i|
			TkcLine.new(@cnv1,@points[i].first,@cnv1['height']-@points[i].last,@points[i+1].first,@cnv1['height']-@points[i+1].last){fill pcolor; width 3}
			#puts "point x:#{@points[i].first}, y:#{@points[i].last}"
		end;	
	end;

end; #class

land=Landscape.new
land.redraw(1)


x=0 #left edge of visible landscape
distance=0 #distance passed
speed=15 #speed
land.initLand
land.redraw('black')

m1=proc{
Tk.after(1000) do
	land.redraw('white')
	land.move(speed)
	land.redraw('black')
end	
}

tm = TkTimer.new(150, -1, m1)
tm.start(0);

Tk.mainloop
