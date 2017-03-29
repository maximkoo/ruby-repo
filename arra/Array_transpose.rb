a=[[1,0,0,4], [0,0,2,4],[3,3,0,0],[0,1,2,0]]
 4.times do |k|
 print a[k]
 puts
 end
puts "-------- transpose"
 b=a.transpose;
 4.times do |k|
 print b[k]
 puts
 end
puts "-------- right"
 4.times do |k|
  a[k].reject!{|i| i==0}
  while a[k].length<4 
    a[k].insert(0,0)
  end;	
  print a[k]
  puts
 end; 
puts "-------- left"
 4.times do |k|
  a[k].reject!{|i| i==0}
  while a[k].length<4 
    a[k]<<0
  end;	
  print a[k]
  puts
 end; 
puts "-------- up"
4.times do |k|
  b[k].reject!{|i| i==0}
  while b[k].length<4 
    b[k]<<0
  end;
 end;
 c=b.transpose 	
 4.times do |k|
  print c[k]
  puts
 end; 
 puts "-------- down"
4.times do |k|
  b[k].reject!{|i| i==0}
  while b[k].length<4 
    b[k].insert(0,0)
  end;
 end;
 c=b.transpose 	
 4.times do |k|
  print c[k]
  puts
 end; 