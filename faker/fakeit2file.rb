require 'rubygems'
require 'faker'
 
#Let's see if we can make a fake person...
person_name            = Faker::Name.name
person_email           = Faker::Internet.email
person_company         = Faker::Company.name
person_company_slogan  = Faker::Company.bs
person_phone           = Faker::PhoneNumber.phone_number
person_address         = Faker::Address.street_address
person_city            = Faker::Address.city
#person_state           = Faker::Address.us_state
person_zip             = Faker::Address.zip_code
 
f=File.open('person.txt','w') do |ff|
 ff.puts(person_name);
 ff.puts(person_email);
 ff.puts(person_company);
 ff.puts(person_company_slogan);
 ff.puts(person_phone);
 ff.puts(person_address);
 ff.puts(person_city);
 ff.puts(person_zip);
end;
puts "Complete"


