#https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals#The_.25_Notation

### STRING INTERPOLATION ###

puts "this is a string" #=> "this is a string"

puts "three plus three is #{3+3}" #=> "three plus three is 6" 

foobar = "blah" 
puts "the value of foobar is #{foobar}" #=> "the value of foobar is blah" 

puts 'the value of foobar is #{foobar}' #=> "the value of foobar is \#{foobar}" # в одиночных кавычках не работает

#puts "s"+197 #не работает
puts "s"<<197 #добавляем символ с кодом 197 к строке
puts "s"<<"\s" #добавляем пробел
puts "s"<<"\u0123" #добавляем символ Юникода 0123 # sģ
puts "s"<<"\t"<<"s" #добавляем символ табуляции # s	s

#строка, содержащая кавычки
puts %{78% of statistics are "made up" on the spot}#=> "78% of statistics are \"made up\" on the spot"
#можно использовать другой ограничитель
puts %(78% of statistics are (made up) on the spot)#=> 78% of statistics are (made up) on the spot

# Modifier 	Meaning
# %q[ ] 	Non-interpolated String (except for \\ \[ and \])
# %Q[ ] 	Interpolated String (default)
# %r[ ] 	Interpolated Regexp (flags can appear after the closing delimiter)
# %i[ ] 	Non-interpolated Array of symbols, separated by whitespace (after Ruby 2.0)
# %I[ ] 	Interpolated Array of symbols, separated by whitespace (after Ruby 2.0)
# %w[ ] 	Non-interpolated Array of words, separated by whitespace
# %W[ ] 	Interpolated Array of words, separated by whitespace
# %x[ ] 	Interpolated shell command
# %s[ ] 	Non-interpolated symbol

puts %q{one\ntwo\n#{ 1 + 2 }} #=> "one\ntwo\n#{ 1 + 2 }"
puts %Q{one\ntwo\n#{ 1 + 2 }}#=> "one (перенос) two (перенос) 3"

puts %w{one two \nthree}#=> one (перенос) two (перенос) three #вообще это массив
puts %W{one two \nthree}#=> one (перенос) two (перенос)(перенос) \nthree #вообще это массив

puts %i{one two \nthree} # after Ruby 2.0 #=> one (перенос) two (перенос) three #вообще это массив
puts %I{one two \nthree} # after Ruby 2.0 #=> one (перенос) two (перенос)(перенос) three #вообще это массив

puts %x{ruby --copyright}#=> "ruby - Copyright (C) 1993-2009 Yukihiro Matsumoto\n"
puts %x{ruby -v}#=> "ruby 2.1.5p273 (2014-11-13 revision 48405) [i386-mingw32]"

aaa=[]
aaa<<%W{one two \nthree}
vline="There is yet another way to make a string, known as a 'here document', where the delimiter itself can be any string:"
aaa<<%W[#{vline}]

puts %x{echo ololo>c:\\Users\\mkopachevskiy\\Documents\\ololo.txt}
puts %x{echo ololo>ololo.txt} # то же самое, путь определяется относительно самого rb файла
%x{echo ololololololo>olololo.txt} #можно так
%x{echo #{vline}>ololololo.txt} #можно так, самый простой способ записать чтонть в файл
