class EEE
	attr_accessor :ppp
end;

class E2
	attr_accessor :ppp
	def initialize
		yield(self)
	end;

	def intro
		puts @ppp
	end;	
end;


q=EEE.new
q.ppp=1
puts q.ppp

qq=E2.new do |t| 
	t.ppp=2
end
puts qq.ppp
qq.intro

