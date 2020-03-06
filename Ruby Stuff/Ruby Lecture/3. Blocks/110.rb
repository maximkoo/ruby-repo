class C1
     attr_accessor :a1, :a2
     def initialize
          yield(self)
     end;    
end;

a=C1.new do |x|
     x.a1=5
     x.a2=10
end
puts a.inspect

b=C1.new do |x|
     x.a1=500
     x.a2=1000
end
puts b.inspect

