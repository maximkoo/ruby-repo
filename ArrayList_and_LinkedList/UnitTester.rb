require 'minitest/autorun'
require './arraylist_and_linkedlist.rb'
class UnitTester<Minitest::Test
	#https://www.developerfusion.com/article/84444/unit-testing-in-ruby/
	#https://semaphoreci.com/community/tutorials/getting-started-with-minitest
	#https://launchschool.com/blog/assert-yourself-an-introduction-to-minitest --<<--
	def test_ArrayList1
		@list=ArrayList.new;
		@list.add(20);
		@list.add(40);
		@list.add(60);
		assert_equal(@list.get(0),20);
		assert_equal(@list.length,3);		
	end;

	def test_ArrayList2
		@list=ArrayList.new;
		@list.add(20);
		@list.add(40);
		@list.add(60);
		@list.remove(0)
		assert_equal(@list.get(0),40);
		assert_equal(@list.length,2);
	end;	

	describe 'DSL test case' do
		it 'checks the first element' do
			@list=ArrayList.new;
			@list.add(20);
			@list.add(40);
			@list.add(60);	
			#@list.get(0).must_equal 20 # раньше писалось вот так, теперь это Deprecated
    		_(@list.get(0)).must_equal 20
    	end;
    	it 'checks the second element' do
    		@list=ArrayList.new;
			@list.add(20);
			@list.add(40);
			@list.add(60);	
    		_(@list.get(1)).must_equal 40 
    	end;
    	it 'checks the third element' do
    		@list=ArrayList.new;
			@list.add(20);
			@list.add(40);
			@list.add(60);	
    		value(@list.get(2)).must_equal 60 
    	end;
    	it 'checks the length method' do
    		@list=ArrayList.new;
			@list.add(20);
			@list.add(40);
			@list.add(60);	
    		expect(@list.length).must_equal 3 
    	end;
    	it 'checks the remove method' do
    		@list=ArrayList.new;
			@list.add(20);
			@list.add(40);
			@list.add(60);	
			_(@list.get(0)).must_equal 20
    		_(@list.length).must_equal 3 
    		@list.remove(0)
			_(@list.get(0)).must_equal 40
			_(@list.get(1)).must_equal 60
    		_(@list.length).must_equal 2
    		@list.remove(2)
    		_(@list.length).must_equal 1  
    	end;	
  end

end;