# https://robots.thoughtbot.com/ruby-2-keyword-arguments

# В Руби 2.0 появились именованные параметры

	def foo(bar: 'default')
	  puts bar
	end

	foo # => 'default'
	foo(bar: 'baz') # => 'baz'

	# Также может быть именованный параметр у блока

	define_method(:foo) do |bar: 'default'|
	  puts bar
	end

	foo # => 'default'
	foo(bar: 'baz') # => 'baz'

# В Руби 2.0 появились ОБЯЗАТЕЛЬНЫЕ именованные параметры

	def foo(bar:)
	  puts bar
	end

	#foo # => ArgumentError: missing keyword: bar
	foo(bar: 'baz') # => 'baz'

puts "***********"

def foo(bar: :baz, **another_parameter)	
	puts bar
	puts another_parameter	
end;

foo(bar: :baz)
#=> baz
#=> {}
foo(bar: :baz, koko: :TROLO)
#=> baz
#=> {:koko=>:TROLO}
foo(bar: :baz, kokoko: :TROLOLO)
#=> baz
#=> {:kokoko=>:TROLOLO}

puts "***********"
def foo(bar: :baz, **_)	
	puts bar
	#puts another_parameter
end;

foo(xx: :xx) #=> Ничего не происходит

foo(bar: :baz)
#=> baz
foo(bar: :baz, koko: :TROLO)
#=> baz
foo(bar: :baz, kokoko: :TROLOLO)
#=> baz


def foo (bar, _)
	puts bar
end;	

foo(:baz, 1)

def foo (bar, _, _)
	puts bar
end;	

foo(:baz, 1,2)

a=5.method("+")
puts a.call(1)