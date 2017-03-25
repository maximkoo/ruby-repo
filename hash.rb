h={}
h[:s]="stuff"
h["s"]="stuffff"
h['s']="sss"

puts h

hh={"s"=>"stuff"}
hhh={:s => :stuff}
hhh={'s'=>'SS'}

hhhh=Hash.new("TROLOLO")
#hhhh['s']="1"
puts hh
puts hhh
puts hhhh[0]
puts hhhh[666]

h5=Hash["s"=>"1","ss"=>2]

h6=Hash.new do |v,k| 
	v[k]="OLOLO #{k}"
end;	
puts h6[1];
puts h6[2];
puts h6

