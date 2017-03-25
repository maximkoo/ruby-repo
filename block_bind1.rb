def m1#(&a)
	str="x"
	yield;
end;

str="M1";
a=proc{puts str}
m1(&a)