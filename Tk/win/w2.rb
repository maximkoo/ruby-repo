require 'tk'
@root1 = TkRoot.new {
     title "Hello Tk!"; padx 50; pady 15
}

myicon = TkPhotoImage.new('file' => 'no.gif')
@root1.iconphoto(myicon)
#puts @root1.stackorder

@groupBox1=TkLabelframe.new(@root1) {text 'Кнопки с первой по третью'; padx 10; pady 10}.grid :column=>0, :row=>0 

label1=TkLabel.new(@groupBox1){text "Press the button ->"}.grid :column=>1, :row=>1
btn1=TkButton.new(@groupBox1) {text 'Press here'; command 'btn1Press'}
btn1.grid :column=>2, :row=>1

label2=TkLabel.new(@groupBox1){text "Press the button ->"}.grid :column=>1, :row=>2
btn2=TkButton.new(@groupBox1) {text 'Press here'; command 'btn2Press'}.grid :column=>2, :row=>2

label3=TkLabel.new(@groupBox1){text "Press the button ->"}.grid :column=>1, :row=>3
btn3=TkButton.new(@groupBox1) {text 'Press here'; command 'btn3Press'}.grid :column=>2, :row=>3

label4=TkLabel.new(@root1){text "Open a file ->"}.grid :column=>1, :row=>4
btn4=TkButton.new(@root1) {text 'Press here'; command 'btnOpenFilePress'}.grid :column=>2, :row=>4

label5=TkLabel.new(@root1){text "Choose color ->"}.grid :column=>1, :row=>5
btn5=TkButton.new(@root1) {text 'Press here'; command 'btnChooseColor'}.grid :column=>2, :row=>5


def btn1Press
	@root2=TkToplevel.new(@root1);	
	@root2['title']="What a great window!!!11"
	@root2['geometry'] = '100x200+50+40'
	#puts @root2.stackorder=40 ## Не работает
	##Tk.after 2000, proc{@root2.destroy} #забавноо
	#Tk.after 2000, proc{@root1.raise}
end

def btn2Press
	@root2.destroy if @root2;	
end

def btn3Press #не работает
	puts @root2.state
	if @root2.state==['normal']
		#@root2.iconify
		@root2.state=['iconic']
	end;
	if @root2.state==['iconic']
		#@root2.deiconify
		@root2.state=['normal']
	end;	
end;

def btnOpenFilePress	
	filename = Tk::getOpenFile
	puts filename
end;	

def btnChooseColor
	c1=Tk::chooseColor :initialcolor => '#ff0000'
	#puts c1
	Tk::messageBox :message => c1
end		


Tk.mainloop;