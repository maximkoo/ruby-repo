require 'test/unit'
class C1
	def m1
		4
	end;

	def m2
		0
	end;	
end;

class MyTest < Test::Unit::TestCase  
  def test_1()  
    @c1=C1.new;	
    assert_equal(@c1.m1, 4);
    assert_instance_of(C1, @c1);
    assert_kind_of(Object, @c1);
  end;
  
  def test_2()
  	@c1=C1.new;
  	assert_equal(@c1.m2, 0);
  end;
end;    