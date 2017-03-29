require 'tk'
require 'oci8'

class OraTk
	def initialize
		conn = OCI8.new('rails1','12345','XE')
		@root1 = TkRoot.new {title "The ultimate cells game"; padx 10; pady 10;}
				#frame1=TkFrame.new(@root).grid :column => 0, :row => 0
		TkGrid.columnconfigure( @root1, 0, :weight => 10 )
		TkGrid.rowconfigure( @root1, 0, :weight => 100 )
		TkGrid.columnconfigure( @root1, 1, :weight => 1 )

		#@cnv1=TkCanvas.new(@root1).grid :sticky => 'nwes', :column => 0, :row => 0
		#@cnv1['width']=@fSize*@cSize+@fSize*@gapSize+@gapSize;
		#@cnv1['height']=@fSize*@cSize+@fSize*@gapSize+@gapSize;
		
		@frame1=TkFrame.new(@root).grid :sticky => 'nwes', :column => 1, :row => 0
		TkGrid.columnconfigure( @frame1, 0, :weight => 10 )
		TkGrid.rowconfigure( @frame1, 0, :weight => 100 )
		TkGrid.rowconfigure( @frame1, 1, :weight => 100 )

		startCmd=proc {startBtnClick}
		@startBtn=TkButton.new(@frame1){text "Start"; command startCmd}.grid :column => 0, :row => 0, :padx => 10, :pady=>10
		@text = TkText.new(@frame) {width 40; height 10}.grid :column => 0, :row => 0, :padx => 10, :pady=>10

		@root1.bind('KeyRelease', startCmd)


		@arr=[]
		res=conn.exec("select p.* from people p") do |x| # только *, поле указать нельзя
			@text.insert('end', x[1]+"\n") #двойные кавычки!
			@arr.push(x[1]);
		end;	

		@text1 = TkText.new(@frame1) {width 40; height 1}.grid :column => 0, :row => 1, :padx => 10, :pady=>10
		conn.logoff
	end;

	def startBtnClick
		var=@text1.get("1.0",'end')
		arr1=@arr.select{|x| x =~ Regexp.new(var.chomp)}  #x=~/#{var}/}
		@text.delete('1.0','end')
		#@text.insert('end',arr1.size);
		arr1.each {|xx|	@text.insert('end', xx+"\n")}
		#@text.insert('end',@text1.get("1.0",'end'));		
	end;	
end;


gf=OraTk.new
Tk.mainloop;