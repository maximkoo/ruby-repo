class spaceShips_001
    attr_accessor :x,:y, :poly
     def initialize
        yield(self)
        @poly=[]
        @poly<<{:x=>27, :y=>0}
        @poly<<{:x=>47, :y=>0}
        @poly<<{:x=>47, :y=>7}
        @poly<<{:x=>57, :y=>7}
        @poly<<{:x=>57, :y=>0}
        @poly<<{:x=>77, :y=>0}
        @poly<<{:x=>77, :y=>4}
        @poly<<{:x=>93, :y=>9}
        @poly<<{:x=>105, :y=>56}
        @poly<<{:x=>82, :y=>80}
        @poly<<{:x=>74, :y=>75}
        #здесь пропуск
        @poly<<{:x=>68, :y=>44}
        @poly<<{:x=>61, :y=>63}
        @poly<<{:x=>44, :y=>63}
        @poly<<{:x=>37, :y=>44}
        #здесь пропуск
        @poly<<{:x=>30, :y=>75}
        @poly<<{:x=>23, :y=>80}
        @poly<<{:x=>0, :y=>56}
        @poly<<{:x=>13, :y=>9}
        @poly<<{:x=>27, :y=>4}




        @poly<<@poly.first.clone;
        @poly.each{|p| p[:x]+=@x; p[:y]+=@y;}
        #@img=Gosu::Image.new('./meteorBrown_big1.png');
     end;