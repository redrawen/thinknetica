# encoding: utf-8
months = {january: 31,february: 28,march: 31,april: 30,may: 31,june: 30,july: 31,august: 30,september: 31,october: 30,november: 31,december: 30}
a = months.to_a
 
months.each do |key , value|
	if value == 30
	puts "in #{key} there are #{value} days"
end
end