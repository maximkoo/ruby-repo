require 'date'
puts Time.now+1 ## +1 second
puts Time.now+60 ## +1 minute
puts Time.now+60*60 ## +1 hour
puts Time.now+60*60*24 ## +1 day
puts Time.now+60*60*24*7 ## +1 week
puts '---'
puts Date.today #require date #2016-03-11
puts Time.now #2016-03-11 19:51:57 +0300
puts Date.today.prev_month #на месяц раньше
puts Date.today.next_month #на месяц позже