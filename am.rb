require 'active_model'
class C1
	include ActiveModel::Validations #добавляет к классу кучу методов - valid?, validate, validate_with и errors
	attr_accessor :first_name, :last_name, :age, :address

	# как бы декларация способа валидирования
	# запускается при использовании метода valid? или validate 
	validates_each :first_name, :last_name, :age, :address do |entity, attr, value|
		entity.errors.add(attr, "is empty") if value.nil?
	end;
def initialize(first_name,last_name)
	@first_name=first_name
	@last_name=last_name	
end;
end;	

puts "--- 1 ---"
p1=C1.new("Ололег","Ололоев")
puts p1.valid? #=> false
puts p1.errors.messages #=> {:age=>["is empty"], :address=>["is empty"]}
puts 

class C2 # Точно такой же, просто чтобы не путаться
	include ActiveModel::Validations
	attr_accessor :first_name, :last_name, :age, :address

	validates_presence_of :address, on: :kokoko # kokoko - "контекст" валидации, на самом деле что-то вроде её персонального имени

def initialize(first_name,last_name)
	@first_name=first_name
	@last_name=last_name
end;
end;

puts "--- 2 ---"
p2=C2.new("Ололег","Ололоев")
puts p2.valid? #=> true, потому что валидаций без контекста у нас нет
puts p2.valid?(:kokoko) #=> false 
puts p2.errors.messages #=> {:address=>["can't be blank"]}
p2.address="Moscow, Red Square"
puts p2.valid?(:kokoko) #=> true, потому что address заполнен
puts

class C3
	include ActiveModel::Validations
	attr_accessor :first_name, :last_name, :age, :address

	validates :age, presence: true # другая форма записи validates_presence_of
	validates :age, numericality: true # только числа
	validates :age, presence: true, if: Proc.new { |a| (10..100)===a } # только в диапазоне от 10 до 100
def initialize(first_name,last_name)
	@first_name=first_name
	@last_name=last_name
end;
end;

puts "--- 3 ---"
p3=C3.new("Ололег","Ололоев")
puts p3.valid? #=> false
puts p3.errors.messages #=> {:age=>["can't be blank", "is not a number"]}
puts 

## Валидация с помощью собственного метода
puts "--- 4 ---"
class C4
	include ActiveModel::Validations
	attr_accessor :first_name, :last_name, :age, :address
	validate :validationMethod

	def initialize(first_name,last_name)
		@first_name=first_name
		@last_name=last_name
	end;

	def validationMethod
		self.errors.add :age, 'Age i nil or not within he range specified' if self.age.nil? || !self.age.between?(10,100)
	end;	
end;

p4=C4.new("Ололег","Ололоев")
puts p4.valid? #=>false
puts p4.errors.messages #=> {:age=>["Age i nil or not within he range specified"]}
p4.age=50
puts p4.valid? #=> true
puts p4.errors.messages #=>{}
puts 

## Валидация с помощью отдельного класса-валидатора
puts "--- 5 ---"
class MyValidator < ActiveModel::Validator
  	def validate(record) # такой класс обязательно должен описывать метод validate
  		record.errors.add :age, 'Age i nil or not within he range specified' if record.age.nil? || !record.age.between?(10,100)
  	end;
end;

class C5
	include ActiveModel::Validations
	attr_accessor :first_name, :last_name, :age, :address
	validates_with MyValidator

	def initialize(first_name,last_name)
		@first_name=first_name
		@last_name=last_name
	end;
end;

p5=C5.new("Ололег","Ололоев")
puts p5.valid? #=> false
puts p5.errors.messages #=> {:age=>["Age i nil or not within he range specified"]}
