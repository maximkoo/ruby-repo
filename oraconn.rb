require 'oci8'
oci = OCI8.new('maximko','kladivo','ORCL')
oci.exec('select region_name from regions') do |record|
  puts record.join(',')
end