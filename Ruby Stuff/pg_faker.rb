require 'pg'
require 'faker'

begin
    con = PG.connect :dbname => 'postgres', :user => 'postgres', :password=>'postgres'
    100.times do |i|
        con.exec(%Q{insert into people(person_id, person_name, person_gender, birth_date) values (nextval('person_seq'), '#{Faker::Name.name.gsub("'","''")}', true), now();});
    end;
rescue PG::Error => e
    puts e.message
ensure
    con.close if con   
end
