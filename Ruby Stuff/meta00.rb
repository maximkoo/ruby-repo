class C2
	puts "self.class=#{self.class}" #=>self.class=Class то есть self - это наш класс C2 - экземпляр класса Class
	puts "self.name=#{self.name}"#=>self.name=C2 и носит имя С2
	puts "self.superclass=#{self.superclass}" #=>self.superclass=Object
	class<<self
		puts "self.class=#{self.class}"#=>self.class=Class теперь self - это метакласс, который тоже экземпляр класса Class
		puts "self.name=#{self.name}"#=>self.name= названия у него нет
		puts "self.superclass=#{self.superclass}" #=>self.superclass=#<Class:Object>
		def m1 #метод класса
			puts "C2.m1 method"
		end;
		def m2 #тоже метод класса
			puts "C2.m2 method"
		end;
	end;
	puts "-------"	
	puts "self.class=#{self.class}" #=>self.class=Class то есть self - это снова наш класс C2 - экземпляр класса Class
	puts "self.name=#{self.name}"#=>self.name=C2 и снова носит имя С2
	puts "self.superclass=#{self.superclass}" #=>self.superclass=Object
	puts "-------"	
	def m3 #метод экземпляра
		puts "C2.m3 method"
		puts "self.class=#{self.class}"#=>self.class=C2, то есть теперь self - экземпляр класса C2
		#puts "self.superclass=#{self.superclass}" #=>
		#puts "self.name=#{self.name}"#=>
	end;	
end;	

C2.m1
C2.m2
q=C2.new
q.m3

