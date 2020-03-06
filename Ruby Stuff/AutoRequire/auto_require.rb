def auto_require
	a=Dir.glob('./*.*').select{|e| File.file? e}
	a.each do |f|
		puts File.basename(f) if File.basename(f)!=File.basename(__FILE__)
		#puts __FILE__
		require f if File.basename(f)!=File.basename(__FILE__)
	end;	
end;

auto_require;
C1.new.m1
C2.new.m2