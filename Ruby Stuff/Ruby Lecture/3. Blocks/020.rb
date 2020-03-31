def m1
     puts 1
     yield #=> Block executed
     puts 2
end;

m1 do
    puts "Block executed"
end;

# --------
# 1
# Block completed
# 2
