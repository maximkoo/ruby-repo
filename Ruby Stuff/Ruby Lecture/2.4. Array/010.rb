a=[1,3,5,7,9]
b=[2,4,6,8,10]
# Соответствующие элементы массивов собираются попарно
print "Zip: "
arr=a.zip b
puts arr.to_s
# Двумерный массив превращается в одномерный
print "Flatten: "
puts arr.flatten!.to_s
# К каждому элементу прибавляем единицу
arr2=arr.map{|x| x+1}
print "Map: "
puts arr2.to_s

# Переменшиваем массив
print "Shuffle: "
arr.shuffle!
puts arr.to_s

# Снова сортируем элементы массива
print "Sort: "
arr.sort!
puts arr.to_s

# Выбираем только элементы больше пяти
print "Select: "
arr.select!{|x| x>5}
puts arr.to_s

# Удваиваем массив
print "Multiply: "
arr=arr*2
puts arr.to_s

# Находим суммы каждой тройки элементов
puts "Sum within groups of three"
arr.each_slice(3) do |x|
     s=x.reduce(0) {|sum, n| sum+n}
     puts s
end
