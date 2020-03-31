a={}
a=Hash.new

a={"a"=>100, "b"=>200}
a={:a=>100, :b=>200}
puts a
a={a:100, b:200}
puts a

class C1
end;

b={[1,2,3]=>{a:C1.new, b:Time.now}}