a=[]
a<<"red"
a<<"green"
a<<"purple"
a<<"brown"
a<<"yellow"
a<<"grey"

a.each do |z|
	puts z.chars.shuffle.join
end;	