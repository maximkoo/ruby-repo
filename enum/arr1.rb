arr=[1,2,3,4,5]
#s=arr.sum
s=arr.reduce {|sum, i| sum+=i}
puts s #15
s=arr.reduce(1000) {|sum, i| sum+=i}
puts s #1015
s=arr.inject(1000) {|sum, i| sum+=i} ## inject = reduce
puts s #1015

s=arr.reduce(1000) {|sum, i| if i>1 then sum+0 else sum+i end}
puts s #1015

puts arr.all? {|i| i> 0}

puts
puts 'MAP'
m=[arr[0],arr[4]].map{|i|i}
print m

puts
puts [1,2,3].join(':')

puts %i(1 2 3).join('.')
puts %w(aa bb cc).join('...')

x=%w(aa bb cc).collect {|i|i}
print x
puts

y={id: 5, name: 'John'}
yy=[{id: 5, name: 'John'}, {id: 6, name: 'James'}]
puts yy[1][:name]
