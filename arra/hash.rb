a={'name'=>'Jonh'}
puts a
puts a['name']
###
a=Hash.new('aaa') ## в скобках значение по умолчанию
a=Hash['name','Holmes']
puts a
puts a['name']
###
a=Hash['name'=>'James']
puts a
puts a['name']
##
a={:name=> :Vasya}
puts a
puts a['name']
###
a={"name", "LOL"} ##не работает!
puts a
puts a['name']