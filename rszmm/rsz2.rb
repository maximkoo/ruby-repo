require 'fastimage_resize'
####
maxSizeH=700
maxSizeV=600
####
tags=[]
fsorted=[]

if ARGV[0]=='--last'
	then fsorted << Dir['*.jpg'].sort_by{|f| File.mtime(f)}.last
	#puts fsorted
elsif ARGV[0]=='--latest'
	then fsorted = Dir['*.jpg'].sort_by{|f| File.mtime(f)}.last(ARGV[1].to_i)
	#puts fsorted		
else fsorted = ARGV
	#puts fsorted	
end;
fsorted.each{|x| 
if x[-1..-1]=="," then xx=x[0..-2] else xx=x; end;
print "Processing "+xx.to_s+' ...'
#puts Dir.pwd+'/'+x

dims=FastImage.size(Dir.pwd+'/'+xx)
FastImage.resize(Dir.pwd+"/"+xx,
                 if dims.first==dims.max then maxSizeH.to_i else 0 end,
                 if dims.first==dims.max then 0 else maxSizeV.to_i end,
 	             :outfile=>"/home/maximko/Octopress/source/images/2015/"+xx.gsub(".","_"+maxSizeH.to_s+"."))
if dims.first==dims.max then
 tags<<"{% img center /images/2015/"+xx.gsub(".","_"+maxSizeH.to_s+".")+" %}"
else
 tags<<"{% img right half /images/2015/"+xx.gsub(".","_"+maxSizeH.to_s+".")+" %}"	
end 
puts "Finished"
}

puts tags
	

##ruby rsz.rb IMG_20150710_144025.jpg "IMG_20150712_112742(1).jpg" IMG_20150714_125123.jpg


	             