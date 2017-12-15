class MyTimer
	@delay=1;
	@start=Time.now
	@last_update=Time.now
	#puts Time.now-@last_update
	 while true
	 	#puts Time.now
	 	next if Time.now-@last_update<@delay		
	 	@last_update=Time.now
	 	puts "Executed #{@last_update}"
	 	exit if Time.now>@start+10
	 end;	
end;