class C1
	def m1
		puts :m1
	end;
end;

c=C1.new

puts Method.instance_methods.grep /to_/		
puts Method.instance_methods.grep /call/

cc=C1.instance_method("m1")
puts cc.class.name #UnboundMethod

ccc=c.method("m1")
ccc.call


# t=Time.now
# sleep(1)
# puts (Time.now-t).round