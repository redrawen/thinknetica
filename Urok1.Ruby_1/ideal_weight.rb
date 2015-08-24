# encoding: utf-8
puts "Введите ваше имя"
name = gets.chomp
puts "Введите ваш рост"
height = gets.chomp
ideal_weight = height.to_i - 110
if ideal_weight < 0 
puts "#{name}, Ваш идеальный вес уже оптимальный!"
else puts"#{name}, Ваш идеальный вес неоптимальный!"
end
