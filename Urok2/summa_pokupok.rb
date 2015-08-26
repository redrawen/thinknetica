# encoding: utf-8
 
puts "***Посчитаем сумму товаров в вашей корзине!***"
stop = 'стоп'
produkts = {}
all_pr = 0
total_price = 0
list = [] 

loop do
puts "Введите Название товара"
title = gets.chomp
if title == stop
break
end
puts "Введите цену товара за единицу в руб."
price = gets.chomp.to_i

puts "Введите кол-во купленного товара"
total = gets.chomp.to_i

#produkts[title] = {'price'=> price, 'total'=> total}
produkts[title] = [price, total]

all_pr = total + all_pr
total_price = total_price + price
end

produkts.each { |key, value| puts "В вашей корзине: #{key} в кол-ве #{value[1]} на сумму #{value[0]} руб."
list << key}
puts "В корзине товары: #{list} в кол-ве #{all_pr} на сумму #{total_price} руб."

