a=["1","2","3","4","5"]
puts a.map(&:to_s) # скобки круглые
# то же самое, что и 
puts a.map{|x| x.to_s}


puts "---"


puts a.each(&:to_sym)
# то же самое, что и 
puts a.each{|x| x.to_sym}

puts "***************************************************"

#s=('a'..'e').to_a
#puts s.map(&:upcase)

a=["q","w","e","r","t","y"]

a.map! do |x|
	x.upcase
end;	
puts a
#https://stackoverflow.com/questions/5587264/do-end-vs-curly-braces-for-blocks-in-ruby
puts a.map {|x| x.upcase}

puts a.map(&:upcase)

p=:upcase.to_proc
puts p.call('a') #=>A

w=Proc.new do |i|
	i.upcase
end;	
puts w.call('m')
#puts Method.instance_methods.grep /^to_*./


puts "----"
class Array
	def array_process(method_name)
		p=method_name.to_proc
		b=[]
		self.each do |n|
			b<<p.call(n)
		end;
		self.clear
		self<<b
	end;	
end;

puts ["a","b","c"].array_process(:upcase) #=> ["A","B","C"]