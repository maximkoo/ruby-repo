class C1
     def method_missing(*args)
          puts "You have called method named \"#{args[0]}\" with params #{args[1..-1]}"
     end;
end;

C1.new.ttt(100,200,300)
