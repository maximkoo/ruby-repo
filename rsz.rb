require 'fastimage_resize'
require 'devkit'
####
maxSize=600
####
tags=[]
ARGV.each{|x| 
if x[-1..-1]=="," then xx=x[0..-2] else xx=x; end;
#puts x[-1..-1]
puts xx
print "Processing "+xx+' ...'
puts Dir.pwd+'/'+x
puts FastImage.size(Dir.pwd+'/'+x).first
puts FastImage.size(Dir.pwd+'/'+x).last

dims=FastImage.size(Dir.pwd+'/'+xx)

#is_horiz=dims.first==dims.max #Horizontal?

FastImage.resize(Dir.pwd+"/"+xx,
                 if dims.first==dims.max then maxSize.to_i else 0 end,
                 if dims.first==dims.max then 0 else maxSize.to_i end,
 	             :outfile=>"c:/Users/Maxim/Documents/Octopress/source/images/2016/"+xx.gsub(".","_"+maxSize.to_s+"."))
if dims.first==dims.max then
 tags<<"{% img center /images/2015/"+xx.gsub(".","_"+maxSize.to_s+".")+" %}"
else
 tags<<"{% img right half /images/2015/"+xx.gsub(".","_"+maxSize.to_s+".")+" %}"	
end 
puts "Finished"
}

puts tags
	

##ruby rsz.rb IMG_20150710_144025.jpg "IMG_20150712_112742(1).jpg" IMG_20150714_125123.jpg


	             