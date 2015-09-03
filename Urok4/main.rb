# encoding: utf-8
require_relative 'Train'
require_relative 'CargoTrain'
require_relative 'PassengerTrain'
require_relative 'RailwayStation'
require_relative 'Route'

puts""
puts "--------------------------ПОЕЗДА---------------------------"
puts" "

train1 = Train.new("Черноморец","cargo", 15)
train2 = Train.new("Варяг","passenger", 20)
station1 = RailwayStation.new("Парк") 
station2 = RailwayStation.new("Площадь")
route1 = Route.new(["Парк","Кокосовая","Банановая","Депо"])

train1.current_speed
train1.accelerate(30)
train1.current_speed
train1.accelerate(40)
train1.current_speed
train1.slow_down(70)
train1.current_speed
train1.cars
train1.car_remove
train1.cars
train2.cars
train2.add_car
train2.cars

puts" "
puts "--------------------------СТАНЦИИ----------------------------"
puts" "
station1.take_train
station1.take_train(train1.train_params)
station1.take_train(train2.train_params)
station1.trains_type
station1.send_train(train1.train_params)
station1.trains

puts" "
"------------------------------МАРШРУТЫ----------------------------"
puts" "

route1.stations_list
route1.add_station("Клубничная") 
route1.add_station("Апельсиновая")
route1.stations_list
route1.del_station("Клубничная")
route1.stations_list
route1.del_station("Банановая")
route1.stations_list