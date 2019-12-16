require 'pg'
require 'faker'

begin
    con = PG.connect :dbname => 'postgres', :user => 'postgres', :password=>'kladivo'
    100.times do |i|
    	con.exec(%Q{insert into people(person_id, person_name, person_gender) values (nextval('person_seq'), '#{Faker::Name.name.gsub("'","''")}', true);});
    end;
rescue PG::Error => e
    puts e.message 
ensure
    con.close if con   
end