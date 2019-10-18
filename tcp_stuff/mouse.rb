require 'gosu'
require 'socket'
class GameWindow<Gosu::Window
	SCREEN_WIDTH=400; #Gosu.screen_width;
	SCREEN_HEIGHT=400;#Gosu.screen_height;
	def initialize
		@server = TCPSocket.new 'localhost', 5678
		super(SCREEN_WIDTH,SCREEN_HEIGHT, false)
		@cells=[]
		@cells2=[]
		#@t.join
		#self.show
		# Thread.new do
		# 	puts Thread.current
		 	receiveMessages(@server)
		# end.join
	end;

	def needs_cursor?
    	true
  	end

  	def button_down(id)
        if id==Gosu::MsLeft
      		#puts "Mouse Clicked at #{mouse_x} : #{mouse_y}"    
      		#@cells<<Hash[x:mouse_x.to_i,y:mouse_y.to_i]
      		@cells<<mouse_x.to_i
      		@cells<<mouse_y.to_i
      		puts "Sending!"
      		sendMessage(@server);
      		puts "Sending done!"
    	end;
    	if id==Gosu::KbEscape
    		#puts @cells
    		close;
    	end;	
    end;	 

    def receiveMessages(server)
    	t=Thread.new do
    		loop do
    			puts "Listen"
				b=server.gets.chomp
				puts b
				#Gosu.draw_rect(100,100,20,20,Gosu::Color::GREEN, 10);
				#@cells2=[100,100]
				@cells2=b.split(",")
				@cells2.map!{|i|i.to_i}
				puts "no listen"
			end;
		end
		#t.join;
    end;	

    def sendMessage(server)
    	msg=@cells.join(",");
    	server.puts(msg);
    end;	

    def draw
    	@cells.each_slice(2).each do |c|
    		#Gosu.draw_rect(c[:x],c[:y],10,10,Gosu::Color::RED, 10);
    		Gosu.draw_rect(c.first,c.last,10,10,Gosu::Color::RED, 10);
    	end
    	@cells2.each_slice(2).each do |c|
    		#Gosu.draw_rect(c[:x],c[:y],10,10,Gosu::Color::RED, 10);
    		Gosu.draw_rect(c.first,c.last,10,10,Gosu::Color::GREEN, 10);
    	end
    end;	
end;
puts Thread.current
c1=GameWindow.new
c1.show;