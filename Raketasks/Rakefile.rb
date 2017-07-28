require './c1.rb'
task :default => [:test]

task :test do
  ruby "c1.rb"
  #C1.new.m1
end

task :test2 do
  C1.new.m1
end