require 'pg'
begin
    con = PG.connect :dbname => 'postgres', :user => 'postgres', :password=>'kladivo'
    q=con.exec 'select 2+2,2+3'
    puts q.values
rescue PG::Error => e
    puts e.message 
ensure
    con.close if con   
end