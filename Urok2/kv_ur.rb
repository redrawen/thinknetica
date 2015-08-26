# encoding: utf-8
puts "Квадратное уравнение ах^2 + bx + c = 0"
puts "Введите а"
a = gets.chomp.to_f
puts "Введите b"
b = gets.chomp.to_f
puts "Введите c"
c = gets.chomp.to_f

d = b**2 - 4*a*c

if d < 0
puts"невозможно вычесть корень из отрицательного числа"

elsif d == 0
      k = Math.sqrt(d)
      x1 = (-b + k)/(2*a)
      puts "Спасибо. Вычисляем дискрименант D..."
	  puts "D = #{d}(корень D = #{k}) и корня x1 = x2 = #{x1}"
elsif d > 0
	  k = Math.sqrt(d)
      x1 = (-b + k)/(2*a)
      x2 = (-b - k)/(2*a)
      puts "Спасибо. Вычисляем дискрименант D..."
	  puts "D = #{d}(корень D = #{k}) и корней x1 = #{x1}, x2 = #{x2}"
end