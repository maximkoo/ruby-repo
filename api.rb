require "Win32API"
message = "This is a sample Windows message box generated using Win32API"

title = "Win32API from Ruby"

api = Win32API.new('user32', 'MessageBox',['L', 'P', 'P', 'L'],'I')

api.call(0,message,title,0)

x1=5
x2=10

isVert=true

#puts a

puts (233+(357-353)*(231-233).fdiv(372-353)).round
puts 101/(1.85*1.85)
puts 504/18