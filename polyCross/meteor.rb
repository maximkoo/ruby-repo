class Meteor
    attr_accessor :x,:y, :poly
     def initialize
        yield(self)
        @poly=[]
        @poly<<{:x=>17, :y=>2}
        @poly<<{x:74, y:2}
        @poly<<{x:99, y:39}
        @poly<<{x:82, y:74}
        @poly<<{x:62, y:70}
        @poly<<{x:29, y:81}
        @poly<<{x:2, y:51}
        @poly<<@poly.first.clone;
        @poly.each{|p| p[:x]+=@x; p[:y]+=@y;}
        @img=Gosu::Image.new('./meteorBrown_big1.png');
     end;

     def draw
        return if @poly.nil?
        (0..@poly.size-1-1).each do |idx|
            #puts @poly[idx]
            Gosu.draw_line(@poly[idx][:x],@poly[idx][:y], Gosu::Color::WHITE, @poly[idx+1][:x], @poly[idx+1][:y],Gosu::Color::WHITE,10);
        end; 
        @img.draw(@x,@y,20); 
     end;
 end;   