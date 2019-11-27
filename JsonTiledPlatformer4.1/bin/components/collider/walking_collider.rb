class WalkingCollider<ColliderCore
	def initialize(master,x,y)
		#super(master,x,y)
		@master=master;
		@master.objects<<self;
	end;

	def update
		cons=contacts(@master, @master.master.master.objects);
		if cons
			# Для памяти: контактов может быть несколько, и их координты могут совпадать или не совпадать
			# надо выбрать из них первый критический, приводящий к остановке и смене состояния
			factContacts=cons.select do |c| 
				puts c.stillId
				puts @master.master.master.objects.select{|p| p.object_id==c.stillId}.size
				puts c.stillName
				puts @master.master.master.objects.select{|p| p.object_id==c.stillId}.first.visible?
				puts @master.master.master.objects.select{|p| p.object_id==c.stillId}.last.visible?
				(c.stillType==OBSTACLE || (c.stillType==VIRTUAL && @master.master.master.objects.select{|p| p.object_id==c.stillId}.first.visible?)) && c.contactType=~/vertical/;
			end;
			factContact=factContacts.first;	                        	
			if factContact
				log "*** #{self.class} factContacts:"
				log factContacts.to_s
				@master.x=factContact[:safeX];
	            @master.y=factContact[:safeY];
	  			@master.master.toState(@master,"stop");
  			end;
  			# надо также выбрать контакты с призами и всякого рода управляющими элементами
		end;	
		
	end;	
end;