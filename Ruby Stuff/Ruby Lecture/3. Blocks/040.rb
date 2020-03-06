def m2
     puts 1
     str="executed with parameter"
    yield(str) if block_given? #=> Block executed
    puts 2
end;

m2 do |x|
    puts "Block #{x}"
end;

# ------
# 1
# Block executed with parameter
# 2
