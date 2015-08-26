# encoding: utf-8
puts "Введите дату (1-31)"
d = gets.chomp.to_i 
puts "Введите месяц (число 1-12)"
m = gets.chomp.to_i 
puts "Введите год"
y = gets.chomp.to_i

if y % 4 == 0 && y != 0
	puts "!!! высокосный год !!!"
	feb = 29
else 
	feb = 28
end
c = m-1
date_number = 0
current_month = []
dates = []

days = {"янв"=>31,"фев"=>feb,"мар"=>30,"апр"=>31,"май"=>31,"июн"=>31,"июл"=>30,"авг"=>31,"снт"=>30,"окт"=>31,"нбр"=>30,"дек"=>31}

days.each{ |key,value| current_month << key}
days.each{ |key,value| dates << value}
 
while c >= 1
 date_number = date_number + dates[c].to_i
 puts dates[c]
 c -= 1
end

date_number += d
puts "Вы ввели #{d} #{current_month[m-1]} #{y} года."
puts "порядковый номер даты : #{date_number}"