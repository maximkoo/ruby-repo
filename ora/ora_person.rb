require 'faker'
require 'oci8'

conn = OCI8.new('user1','12345','XE')
10.times do |i|
 p_name=Faker::Name.name
 puts p_name
 conn.exec('insert into person values(seq1.nextval,:p1)',p_name);
end;
conn.exec('commit');