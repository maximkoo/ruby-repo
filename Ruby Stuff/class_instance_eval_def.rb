class C1
	class_eval("def m1\n puts :m1 \n end");
	instance_eval("def m2\n puts :m2 \n end");
	eval("def m3\n puts :m3 \n end");
	#self.eval("def m4\n puts :m4 \n end"); #private method `eval' called for C1:Class
end;

C1.new.m1
C1.m2
C1.new.m3