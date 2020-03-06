class C1
	@p1=0
	@p2=1
	puts "Self.class=#{self.class}"; #=> Class
	puts "Self.name=#{self.name}"; #=> C1
	def initialize
		@p4=4		
		puts "In initialize Self.class=#{self.class}"; #=>C1
		#puts "Self.name=#{self.name}";
	end;	
end

puts C1.instance_variable_get("@p1") #=>0
q=C1.new
puts q.instance_variable_get("@p4") #=>4

C1.instance_variable_set("@p1",100)
q.instance_variable_set("@p4",400)

puts C1.instance_variable_get("@p1") #=> 100
puts q.instance_variable_get("@p4") #=> 400
#puts C1.methods#.include?("initialize");
