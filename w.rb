# batch.rb
# Ruby script for batch running Word macros
require 'win32ole'
#wrd = WIN32OLE.new('Word.Application')
wrd = WIN32OLE.new('Firefox.Application')
wrd.Visible = 1
#macro_to_run = ARGV.shift()
#ARGV.each do |file|
# doc = wrd.Documents.Add(File.expand_path(file))
#  wrd.Run(macro_to_run)
#  doc.Save()
#  doc.Close()
#end