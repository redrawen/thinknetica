# encoding: utf-8
 
puts "Посчитаем сумму товаров в вашей корзине!"
stop = 'стоп'
produkts = {}
all_pr = 0
total_price = 0 

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
produkts = {title: [price, total]}

all_pr = total + all_pr
total_price = total_price + price
end

produkts[:title].each { |key, v1| puts "В вашей корзине: #{key} в кол-ве #{all_pr} на сумму #{total_price} руб."}

