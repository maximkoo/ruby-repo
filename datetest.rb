a=Time.now
puts a.strftime("%A")
ddd=case a.strftime("%A")
when 'Monday' then "Пн"
when 'Tuesday' then "Вт"
when 'Wednesday' then "Ср"
when 'Thursday' then "Чт"	
when 'Friday' then "Пт"
when 'Saturday' then "Сб"
when 'Sunday' then "Вс"
end;
puts ddd