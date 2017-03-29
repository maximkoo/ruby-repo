require 'oci8'
oci = OCI8.new('user1','12345','XE')
oci.exec('select p_name from person') do |record|
  puts record.join(',')
end