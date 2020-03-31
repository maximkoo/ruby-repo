require 'thread'
t=Thread.new do
puts "a"
end;
puts 1
puts 2
sleep 3