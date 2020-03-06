def m3(a1,a2, a3)
     puts a1
     yield a3 if block_given?
     puts a2
end;    

m3(1,2,"executed with parameter") do |x|
    puts "Block #{x}"
end;

# ------
# 1
# Block executed with parameter
# 2
