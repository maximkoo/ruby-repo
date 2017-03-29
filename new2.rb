require 'inline'
class MyTest
  
    def factorial(n)
      f = 1
      n.downto(2) { |x| f *= x }
      f
    end
  
    inline :C do |builder|
      builder.c "
      long factorial_c(int max) {
        int i=max, result=1;
        while (i >= 2) { result *= i--; }
        return result;
      }"
    end
  end
x=MyTest.new
x.factorial(2)  