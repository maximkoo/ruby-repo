class FallingCollider<ColliderCore
	def initialize(master,x,y)
		#super(master,x,y)
		@master=master;
		@master.objects<<self;
	end;

	def update
		cons=contacts(@master, @master.master.master.objects);
		print "*** Contacts: "
		puts cons.to_s
		if cons
			# Для памяти: контактов может быть несколько, и их координты могут совпадать или не совпадать
			# надо выбрать из них первый критический, приводящий к остановке и смене состояния
			factContacts=cons.select{|c| c.stillClass="MapObject"|| 
										c.stillClass==OBSTACLE || 
				                         c.stillClass==VIRTUAL || 
				                       	(c.stillClass==LADDER && c.contactType=='lower horizontal')};
			puts "*** factContacts:"
			puts factContacts.to_s
			factContact=factContacts.first;	                        	
			if factContact
				@master.x=factContact[:safeX];
	            @master.y=factContact[:safeY];
	  			@master.master.toState(@master,"stop");
  			end;
  			# надо также выбрать контакты с призами и всякого рода управляющими элементами
		end;	
		
	end;	
end;