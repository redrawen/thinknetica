# encoding: utf-8
a = 0
n = 0
l = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","v","x","y","z"]

glasnie = {}

while a <= 26 do
bukva = l[n]
glasnie[bukva] = a
a += 1
n += 1
end

puts glasnie