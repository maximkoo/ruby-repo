require 'tk'
root=TkRoot.new
win=TkToplevel.new

TkButton.new(root, :text=>"Button1",:command=>proc{root.withdraw; win.deiconify}).pack

TkButton.new(win, :text=>"Button2",:command=>proc{win.withdraw; root.deiconify}).pack
Tk.mainloop