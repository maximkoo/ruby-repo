require 'tk'
root = TkRoot.new {
     title "Hello Tk!"; padx 5; pady 1
}

myicon = TkPhotoImage.new('file' => 'no.gif')
root.iconphoto(myicon)

frame1=TkFrame.new(root) {borderwidth 5; relief "groove"; width 500; height 200}
label1=TkLabel.new(frame1) {text "Label1"}
label2=TkLabel.new(frame1) {text "Label2"}
label3=TkLabel.new(frame1) {text "Label3"}
label4=TkLabel.new(frame1) {text "Label4"}

frame1.grid :column=> 0, :row=> 0, :columnspan=> 2, :rowspan=> 2, :sticky=>'nsew'
label1.grid :column=> 0, :row=> 0
label2.grid :column=> 1, :row=> 0
label3.grid :column=> 0, :row=> 1
label4.grid :column=> 1, :row=>1


TkGrid.columnconfigure(root, 0, :weight=>10)
TkGrid.rowconfigure(root, 0, :weight=>10)
Tk.mainloop