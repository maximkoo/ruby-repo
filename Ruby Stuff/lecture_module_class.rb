require './lecture_module.rb'
class C1
	def m1
		Module1::Module_class1.new.cm1		
	end;

	def m2
		Module1::cm2;
	end;
	
	def m3
		# Module1::cm3; => Ошибка !
	end;		
end;		

C1.new.m1
C1.new.m2
C1.new.m3