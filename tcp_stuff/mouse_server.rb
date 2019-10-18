require 'socket'
class MouseServer
	def initialize
		@server=TCPServer.new(5678);
		@sessions=[]
		registerSession;
	end;

	def registerSession
		loop do
			Thread.new(@server.accept) do |sess|
				@sessions<<Hash["session"=>sess]
				#sess.puts("100,100")	
				print "Sessions: "
				@sessions.each do |s|
					print s["session"].object_id.to_s+" ";
				end;	
				puts
				receiveMessages(sess)		
			end
		end.join; #--<<--!!!
		#end;
	end;
	
	def receiveMessages(session)
		#Thread.new do
			puts "Now listening for #{session.object_id}"
			#session.puts("OK!")
			loop do
				puts "listen"
				message=session.gets.chomp;			
				puts "#{session.object_id} says: #{message}"
				sendMessages(session, message)
			end;
		#end;	
	end;

	def sendMessages(origin, message)
		@sessions.each do |sess|
			if sess["session"]!=origin
				puts "Sending to #{sess["session"].object_id}"
				#sess["session"].puts("#{origin.object_id} sends you: #{message}");
				sess["session"].puts(message); 
			end;	
		end;	
	end;	
end;

ms=MouseServer.new;