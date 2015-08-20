# encoding: utf-8
fib = [0,1,1]
n = 2
 while n <= 15 do
 	n += 1
    i = fib[n-2] + fib[n-1]  
	fib << i
end
puts fib