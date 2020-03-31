require './lecture_module.rb'
class C1
	include Mod1
end;

class C2
	extend Mod1
end;

C1::CMod1.new.cm1
C1.new.cm2


