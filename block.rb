class PPP
	def initialize
		puts "INI"
		yield(self) if block_given?##<<-------------!!!!!!!!!
		##т.е выполнить переданный блок (c.intro), используя в качестве параметра само этот объект (self)
	end;
	
	def intro
		puts "intro"
	end;
end;

PPP.new do |c|
	c.intro;
end;		

x=PPP.new