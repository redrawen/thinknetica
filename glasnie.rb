# encoding: utf-8
a = 0
n = 0
hash = {}
result = {}
alphabet = ('a'..'z').to_a
v = ['a','e','i','o','u','y']

alphabet.each_with_index{ |value,index| hash[value] = index+1}
v.each_with_index{|value, index| result[value] = hash[value]}

puts result