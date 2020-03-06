a="abc"
b=a
puts a
puts b
puts a.object_id
puts b.object_id
a="def"
puts a
puts b
puts a.object_id
puts b.object_id