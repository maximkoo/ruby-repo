module Fly
	def self.onTheFly(obj)
		obj.instance_variables.each do |x|
	        obj.define_singleton_method("#{x.to_s.gsub('@','')}=") do |z|
	           obj.instance_variable_set(x,z) 
	        end;

	        obj.define_singleton_method(x.to_s.gsub('@','')) do
	            return obj.instance_variable_get(x)
	        end
	            
	    end; 
	end;	

	def onTheFly2
		instance_variables.each do |x|
	        define_singleton_method("#{x.to_s.gsub('@','')}=") do |z|
	           instance_variable_set(x,z) 
	        end;

	        define_singleton_method(x.to_s.gsub('@','')) do
	            return instance_variable_get(x)
	        end
	            
	    end; 
	end;
end;

class C1
	include Fly
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
 		#Fly.onTheFly(self)	 	
 		onTheFly2   	
    end; 
 end;	

 d=C1.new
 puts d.instance_variables
 
 puts "------"
 puts d.methods


