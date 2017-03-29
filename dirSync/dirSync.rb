##directory sync
class DirSync
 @path
 @log
 
 def initialize(path)
  @path=path
  @log=File.open("log.txt","a");
 end;
 
 def copyFile(pathfile)
  @log.puts(pathfile+"\n");
 end;
 
 def CopyDir(pathdir)
  @log.puts(pathdir+"\n");
 
 def goDeeper()
 end;
 
 def listFiles
   begin
   Dir.entries(@path).each do |f|
		if File.file?(@path+f) 
		 then 
		 begin
		   copyFile(@path+f);
		   rescue Exception
		     next;
		 end;  
		end; 
		if File.directory?(@path+f)	and f!='.' and f!='..' and f!='Octopress'
		 then #we need to go deeper
			copydir(@path+f+'/');
			z=DirSync.new(@path+f+'/');
			z.listFiles;  
		end;	  
   end;
   rescue Errno::EACCES
    @log.puts("Access denied to: #{@path}");
   end;
  end;
end; 

$stdout.reopen("out.txt", "w")
$stderr.reopen("err.txt", "w")
File.open("log.txt","w").truncate(0);
#p="c:\\Users\\Maxim\\Documents\\";
p="c:/Users/Maxim/Documents/";
x=DirSync.new(p);
x.listFiles;