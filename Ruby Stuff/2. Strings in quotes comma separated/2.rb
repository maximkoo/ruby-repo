y=File.open("sdemnb_out.txt","w");
x=File.open("sdemnb.txt","r").each do |line|
	y.write("'"+line.chomp+"',"+"\n");
end;

