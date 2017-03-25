f=File.open("qqq.txt","w");
while a=$stdin.gets 
 f.write(a);
 break if a.chomp=="quit" #можно .strip
end;