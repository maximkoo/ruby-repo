require 'tk'
require 'thread'

class Thr5
	def initialize
		w=proc{btnClk}
		c=self;
		@f=0;
		@root1 = TkRoot.new {title "Thread Run and Stop"; padx 10; pady 10;}
		@frame1=TkFrame.new(@root).grid :sticky => 'nwes', :column => 1, :row => 0
		TkGrid.columnconfigure( @frame1, 0, :weight => 10 )
		TkGrid.rowconfigure( @frame1, 0, :weight => 100 )
		@btnUp=TkButton.new(@frame2){text "Up"; command w}.grid :column => 0, :row => 0
		@labelTurn =TkLabel.new(@frame1){text 0; font 'TkFixedFont'}.grid  :sticky => 'nw', :column => 0, :row => 0, :padx=>20

		@a=0;
		@t=Thread.new do
			while true do
				if @f==1 && !@t.stop?
					Thread.stop
				end;	
				@a+=0.01
				@labelTurn["text"]=@a.round(2).to_s
				sleep 0.1
			end;
		end;

	end;	

	def btnClk
		if @f==0 then @f=1 else @f=0; end;
		puts "ololo, f="+@f.to_s
		puts @t.stop?
		if @f==0 && @t.stop?
				@t.run
		end;
		#if @f==1 
		#	@t.stop;
		#else
		#	@t.run
		#end;	
	end;	
end;	
x=Thr5.new
Tk.mainloop