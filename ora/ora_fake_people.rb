require 'faker'
require 'oci8'

conn = OCI8.new('maxim','kladivo','XE')
10000.times do |i|
 p_name=Faker::Name.name
 p_bday=Faker::Date.birthday;
 #puts p_name
 conn.exec('insert into fake_people values(:p1, :p2)',p_name, p_bday);
end;
conn.exec('commit');