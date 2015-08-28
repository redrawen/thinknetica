# encoding: utf-8
class Train
  #attr_writer:speed
  #attr_reader:speed # геттер  
  #attr_accessor:speed # и геттер и сеттер

@@trains_num = 0

  def initialize(name,type,cars) 
    @name = name
    @type = type
    @cars = cars
    @speed = 0
    @route = []
    @@trains_num += 1
    @number = @@trains_num
    puts "Новый поезд НОМЕР: #{name} #{@number} (train_#{@number}: ТИП: #{@type}, КОЛ_ВО ВАГОНОВ: #{@cars})!!!"
  end

  #def description
  #puts "Поезд: #{name}, тип: #{type}, кол-во вагонов: #{cars}!"
#end

  def accelerate(value)
    @speed += value
    puts "Добавлено #{value} к текущей скорости поезда #{@number}"
  end

  def current_speed
    puts "Текущая скорость поезда #{@number} - #{@speed}"
  end

  def slow_down(value)
    if @speed == 0
      puts "Поезд #{@number} не движется!"
    elsif @speed > value
      @speed -= value
      puts "Уменьшить скорость #{@number} на #{value}"
    else
      @speed = 0
      puts "Поезд #{@number} остановлен"
    end
  end 

  def cars
    puts "Кол-во вагонов #{@cars} у поезда #{@number}"
  end

  def add_car
    if @speed == 0
      @cars += 1
      puts "Вагон прицеплен к поезду #{@number}"
    else
      puts "нельзя прицепить вагон к движущемуся поезду(train_#{@number})"
    end
  end

  def car_remove
    if @speed == 0
      if @cars > 0
        @cars -= 1
        puts "Вагон отцеплен от поезда#{@number}"
      else
        puts "Нет вагоно для отцепки#{@number}!"
      end
    else
      puts "Нельзя отцепить вагон от движущегося поезда(train_#{@number})"
    end
  end

  def accept_route(route)
    @route = route
    @station = route.first
  end

  def move_to(station)
    if @route.include?(station)
      @station = station
      puts "Для поезда #{@number} текущая станция: #{@station}."
    else
      puts "Нельзя переместить поезд #{@number} на станцию #{station}.Такой станции нет в маршруте."
    end
  end

  def position
    puts "Для поезда #{@number} текущая станция: #{@station}."
  end

  def train_params
    return {type: @type, cars: @cars}
  end
end

class RailwayStation
  @@stations_num = 0
  
  def initialize(name)
    @name = name
    @trains = []
    @@stations_num += 1
    puts "Новая станция (#{@name})!!!"
  end

  def take_train(params = {})
    if params[:type].nil? || params[:cars].nil?
      puts "Не существующий поезд. Невозможно принять на станцию!"
    else
      @trains << {type: params[:type], cars: params[:cars]}
      puts "Еще один поезд (type: #{params[:type]}, кол-во вагонов: #{params[:cars]}) прибыл на станцию #{@name}."
      puts "Сейчас #{@trains.size} поездов на станции"
    end
  end

  def trains
    puts "Всего #{@trains.size} поездов на станции #{@name}:"
    @trains.each_with_index { |train, index| puts "#{index + 1}. #{train[:type]}, #{train[:cars]} вагонов"}
  end

  def trains_type
    puts "Всего #{@trains.size} поездов на станции #{@name}:"
    puts " - грузовых: #{(@trains.select {|train| train[:type] == "груз"}).size}"
    puts " - пассажирских: #{(@trains.select {|train| train[:type] == "пасс"}).size}"
  end

  def send_train(params = {})
    if @trains.include?({ type: params[:type], cars: params[:cars] }) 
      @trains.delete({ type: params[:type], cars: params[:cars] })
      puts "Поезд (type: #{params[:type]}, кол-во вагонов: #{params[:cars]}) покинул станцию #{@name}."
      puts "Теперь кол-во поездов на станции: #{@trains.size}."
    else
      puts "На станции #{@name} нет поездов."
    end
  end
end


class Route
  @@routes_number = 0

  def initialize(stations = [])
    if stations.size >= 2
      @stations = stations
      @@routes_number += 1
      @number = @@routes_number
      puts "Новый маршрут номер #{@number} (route_#{@number}: #{@stations.first} - #{@stations.last}) создан."
    else
      puts "Маршрут должен содержать как минимум 2 станции."
    end
  end

  def add_station(station)
    @stations.insert(-2, station)
    puts "Новая станция (#{station}) добавлена в маршрут #{@number}."
  end

  def del_station(station)
    if @stations.include?(station)
      @stations.delete(station)
      puts "Станция #{station} удалена из маршрута - #{@number}."
    else
      puts "Невозможно удалить #{station} из маршрута #{@number},нет такой станции в маршруте."
    end
  end

  def stations_list
    puts "Маршрут#{@number} от #{@stations.first} до #{@stations.last} имеет следующую станцию: "
    @stations.each_with_index{ |station, index| puts "#{index + 1}. #{station}"}
  end

  def stations
    @stations
  end
end

train1 = Train.new("Поезд1","груз", 15)
train2 = Train.new("Поезд2","пасс", 20)
station1 = RailwayStation.new("Парк") 
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

puts "-СТАНЦИИ-"
puts"------------------------------------"
station1.take_train
station1.take_train(train1.train_params)
station1.take_train(train2.train_params)
station1.trains_type
station1.send_train(train1.train_params)
station1.trains

"-МАРШРУТЫ-"
puts"------------------------------------"

route1.stations_list
route1.add_station("Клубничная") 
route1.add_station("Апельсиновая")
route1.stations_list
route1.del_station("Клубничная")
route1.stations_list
route1.del_station("Банановая")