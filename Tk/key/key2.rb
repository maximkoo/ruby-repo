require 'tk'

	@root1 = TkRoot.new {title "keyPress"; padx 10; pady 10;}
	lbl1=TkLabel.new(@root1){text 'OLOLO'}.place :x=>20, :y=>20
	
	

	p1=proc{(1..10).each do |xxx|
			Tk.after(500) {lbl1.place(:x=>20+xxx*10)}
	end}

	@root1.bind('Key', p1, "%K")
Tk.mainloop	