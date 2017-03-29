require 'tk'
	


	@root1 = TkRoot.new {title "keyPress"; padx 10; pady 10;}
	@cnv1=TkCanvas.new(@root1){background 'white'}.grid :sticky => 'nwes', :column => 0, :row => 0
	@lbl=TkLabel.new(@root1){text 'OLOLO'}.grid :sticky => 'nwes', :column => 0, :row => 1
	@lbl2=TkLabel.new(@root1){text 'OLOLO'}.grid :sticky => 'nwes', :column => 0, :row => 2
	@lbl3=TkLabel.new(@root1){text 'OLOLO'}.grid :sticky => 'nwes', :column => 0, :row => 3

	r = TkcRectangle.new(@cnv1, 10, 60, 30, 80, :fill => 'black')
	
	c2=0
	c3=0
	setColor=proc{if r['fill']=='red'
						r['fill']='black'
					else 
						r['fill']='red'
					end
					#r['x1']=200
					}

	p1=proc{|k| @lbl['text']="key pressed #{k}"
				puts k
				if k=='Up'
					setColor.call
				end	
				}
					
	p2=proc{c2+=1; @lbl2['text']="key pressed #{c2}"}		
	p3=proc{c3+=1; @lbl3['text']="key pressed #{c3}"}			
	#virtual_event = TkVirtualEvent.new('KeyPress-Up', 'KeyPress-Down')

	@root1.bind( 'Key', setColor)
	@root1.bind('Key', p1, "%K") #proc{|k| @lbl['text']="key pressed #{k}"}, "%K")



	@root1.bind('KeyPress-Down', p2) #нажатие кнопки ВНИЗ
	@root1.bind('KeyPress-Up', p3) #нажатие кнопки ВВЕРХ

	Tk.mainloop