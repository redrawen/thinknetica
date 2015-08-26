# encoding: utf-8
puts "Введите длину основания треугольника (a)"
a = gets.chomp
puts "Введите высоту треугольника (h)"
h = gets.chomp
s = (1.0/2) * a.to_i * h.to_i 
puts "Площадь треугольника равна = #{s}"