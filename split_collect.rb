#The split mode :

   pet1, pet2, pet3 = *["duck","dog","cat"]

#The collect mode :

  *zoo = pet1, pet2, pet3

#The splat operator can be used in a case statement :
name="Maximkoo"

BOARD_MEMBERS = ['Jan', 'Julie', 'Archie', 'Stewick', "Maximkoo"]
HISTORIANS = ['Braith', 'Dewey', 'Eduardo',"Maximkoo"]
case name
   when *HISTORIANS&BOARD_MEMBERS
  puts "Здесь ничего не написано"
 when *BOARD_MEMBERS
  puts "You're on the board!  A congratulations is in order."
 when *HISTORIANS
  puts "You are busy chronicling every deft play." 
 when *HISTORIANS|BOARD_MEMBERS
  puts "We welcome you all to the First International Symposium of Board Members and Historians Alike."

 end

#We can also use the splat operator to create a Hash object form a array of pairs.

a = [[:planes, 21], [:cars, 36]]
h = Hash[*a]  # => { :planes=>21, :cars=>36}