# encoding: utf-8
class Train
    
  def initialize(name,type,cars) #завести двигатель
    @name = name
    @type = type
    @cars = cars
  end

  def description
  if type == 1
    type = "Грузовой"
  elsif type == 2
   type = "Пассажирский"
  end
  puts "Поезд: #{name}, тип: #{type}, кол-во вагонов: #{cars}!"
end

class RailwayStation < Train
	#@@all_trains = 0
	#@@current_trains = 0
	#@rwsname = rwsname
	
	#def accept_trains
	#	@@all_trains += 1
	#	@@current_trains += 1
	#end
    #def list_current_trains
    #    puts "Всего на станции в текущий момент: #{current_trains}"
    #end
    #def list_alltrains_type
    #	puts "Всего на станции: #{alltrains} , тип: #{type}"
    #end
    #def takeoff_trains
    #	@@current_trains -= 1
    #end

 	#def rwsname
	#puts "Название станции: #{rwsname}"
	#end
end

class Route < Train
    #@@all_stations = {}
    #@start_station = start_station
	#@end_route = end_route


    #def route(start_station,end_route)
	#puts "Маршрут: начало (#{start_station}) - (#{end_route})"
	#end
	
	#def add_station
	#	all_stations[:list] 
	#end
	
	#def del_station
     #   all_station[:list]
	#end
	
	#def display_stations
    #   puts "Все станции: #{@@all_stations[:list]}"
    #end
end
#make new Train instance
puts "Введите поочередно название поезда,тип (1-груз или 2-пасс),кол-во вагонов поезда"
train = Train.new("#{gets.chomp}","#{gets.chomp.to_i}","#{gets.chomp.to_i}")
train.description
