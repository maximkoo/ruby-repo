def foo(bar:)
puts bar
end
foo # => 'default'
foo(bar: 'baz') # => 'baz'