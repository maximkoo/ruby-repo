p1=Proc.new do |x|
     puts "Proc 1 executed #{x}"
end

p2=Proc.new do |x,y|
     puts "Proc 2 executed #{x} #{y}"
end;

def m5(param1,param2)
     puts param1.class.name #=> Proc
     param1.call("with parameter")
     puts param2.class.name #=> Proc
     param2.call("with two","parameters")
end;    

m5(p1,p2)

