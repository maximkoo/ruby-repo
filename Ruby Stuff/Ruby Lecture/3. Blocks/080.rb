def m6(&block1)
     puts block1.class.name
     block1.call
     yield
end;    

pp=Proc.new do
     puts "Proc executed as a block"
end

m6(&pp)