require 'tk'
app = TkRoot.new {
     title "Hello Tk!"; padx 50; pady 15
}

myicon = TkPhotoImage.new('file' => 'no.gif')
app.iconphoto(myicon)

@a=TkLabel.new(app) {
     text "Hello, World!"
     relief "groove"
     # pack { padx 100; pady 100 ; side left ; relief groove}
     pack('padx'=>0, 'pady'=>10, 'side'=>'left')
}
@b=TkLabel.new(app) {
     text "Hello, World!"
     relief "raised"
     # pack { padx 100; pady 100 ; side left ; relief groove}
     pack('padx'=>0, 'pady'=>10, 'side'=>'left')
}
x=0;
@a.bind('ButtonPress-1', proc { someMethod })
@a.bind('Enter', proc { weEnter })
@a.bind('Leave', proc { weLeave })
@a.bind('ButtonPress-3', proc { weRightClick })

frame1 = Tk::Tile::Frame.new(app) {borderwidth 5; relief "flat"; width 200; height 100; pack('padx'=>0, 'pady'=>10, 'side'=>'left')}
frame1['padding']='5 10'
frame1['borderwidth'] = 2

@label1=TkLabel.new(frame1) {
     text "Label1"
     pack
 }

tv=TkVariable.new
tv="eeee"
  @e=TkEntry.new(frame1) do
	textvariable tv 
	insert(0,'ololo')
 	pack
 end
tv="eeee"
 

def someMethod
 puts "Ouch!"
 @a.text="ouch..."
end;

def weEnter
 puts "Enter!"
 @a.text="enter..."
end

def weLeave
 puts "Leave!"
 @a.text="leave..."
end	

def weRightClick
 puts @a.cget('text')
end;	

Tk.mainloop

	