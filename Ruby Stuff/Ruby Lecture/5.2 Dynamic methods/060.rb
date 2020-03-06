class C1
     def initialize
          @a=0
          @b=0
          @c=0
          @total_amount=1.5
          @top_rated=100          
          @secret_password="12345"
          @many_values=[1,2,3,4,5]
          @current_date=Time.now
          # еще много-много переменных...
     end;          
end;

#Каждую переменную надо снабдить парой методов для доступа, то есть для каждой переменной написать

# def a=(x)
#           @a=x
#      end;
     
#      def a
#           @a
#      end;
     
#      ...

# можно прописать attr_accessor
#attr_accessor :a, :b, :c, :total_amount, :top_rated ....

#puts C1.new.instance_variables