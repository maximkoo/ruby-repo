require 'minitest/autorun'
class Angler
def initialize
end;

def normalize(a)
	if a.between?(-180,180)
		return a
	elsif a>180
		while a>180 do
			a=a-360
		end;
		return a;
	elsif a<-180	
		while a<-180 do
			a=a+360
		end;
		return a;
	end;	
end;

def diff(a1,a2)
	a11=normalize(a1+180)
	a2=normalize(a2);
	if a11>a1
		if a2.between?(a1,a11)
			return a2-a1;	
		else
			if a2<a1
				return a2-a1
			else
				return -1*(360-a1.abs-a2.abs);
			end;	
		end;	
	else
		if a2.between?(a11,a1)
			return a2-a1;	
		else
			if a2>a1
				return a2-a1
			else
				return 360-a1.abs-a2.abs;
			end;	
		end;
	end;	
end;	
end;

 an=Angler.new
 puts an.normalize(-160);
 puts an.normalize(50);
  puts an.normalize(-160+180);
# puts an.normalize(240);
# puts an.normalize(365);
# puts an.normalize(720);
# puts "--"
# puts an.normalize(-20);
# puts an.normalize(-240);
# puts an.normalize(-365);
# puts an.normalize(-720);
# puts an.normalize(-725);

class UnitTester<Minitest::Test
	def test_Angler
		an=Angler.new
		assert_equal(an.diff(-160,-10),150);
		assert_equal(an.diff(-160,50),-150);
		assert_equal(an.diff(-160,-170),-10);
		assert_equal(an.diff(50,-170),140);
		assert_equal(an.diff(-100,-110),-10);
		assert_equal(an.diff(50,-30),-80);
	end;
end;		


