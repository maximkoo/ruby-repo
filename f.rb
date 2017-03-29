x=[]
a=File.open("c:\\Users\\Maxim\\Documents\\cbr.xml","r");
a.each_line do |line|
x<<line
end;
x.each {|z| puts z}