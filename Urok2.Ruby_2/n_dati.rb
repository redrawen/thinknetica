# encoding: utf-8
puts "Введите дату (1-31)"
d = gets.chomp.to_i 
puts "Введите месяц (число 1-12)"
m = gets.chomp.to_i 
puts "Введите год"
y = gets.chomp.to_i

if y % 4 == 0
	puts "!!! высокосный год !!!"
	feb = 29.to_i
else 
	feb = 28.to_i
end
c = m
p_n_d = 0

months = ["янв","фев","мар","апр","май","июн","июл","авг","снт","окт","нояб","дек"]
days = [31, feb, 31, 30, 31, 30, 31, 30, 31, 30, 31, 31]

while c > 1
 p_n_d = p_n_d + days[c-2]
 c -= 1
end
p_n_d = p_n_d + d
puts "Вы ввели #{d} #{months[m-1]} #{y} года."
puts "порядковый номер даты : #{p_n_d}"
