# encoding: utf-8
class Train
  #attr_writer:speed
  #attr_reader:speed # геттер  
  attr_accessor:speed # и геттер и сеттер

@@trains_number = 0

  def initialize(name,type,cars = 0) 
    @name = name
    @type = type
    @cars = cars
    @speed = 0
    @route = []
    @@trains_number += 1
    @number = @@trains_number
    puts "New train number #{@number} (train_#{@number}: type => #{@type}, cars number => #{@cars})!!!"
  end

  #def description
  #puts "Поезд: #{name}, тип: #{type}, кол-во вагонов: #{cars}!"
#end

def accelerate(value)
    self.speed += value
    puts "Add #{value} to the train_#{@number} current speed"
  end

  def current_speed
    puts "Current speed of train_#{@number} is #{@speed}"
  end

  def slow_down(value)
    if speed == 0
      puts "The train_#{@number} is not moving!"
    elsif @speed > value
      speed -= value
      puts "Reduce train_#{@number} speed by #{value}"
    else
      speed = 0
      puts "The train_#{@number} stopped"
    end
    
    def cars
    puts "There are #{@cars} cars in the train_#{@number} now"
    end

  def add_car
    if speed == 0
      cars += 1
      puts "Car added to the train_#{@number}"
    else
      puts "Sorry can't add a car to the moving train (train_#{@number})"
    end
  end

  def car_remove
    if speed == 0
      if cars > 0
        cars -= 1
        puts "Car removed from the train_#{@number}"
      else
        puts "There is no cars to remove from the train_#{@number}!"
      end
    else
      puts "Sorry can't remove a car from the moving train (train_#{@number})"
    end
  end

  def accept_route(route)
    @route = route
    @station = route.first
  end

  def move_to(station)
    if @route.include?(station)
      @station = station
      puts "The train_#{@number} current station is: #{@station}."
    else
      puts "Could not move train_#{@number} to the #{station}.The station isn't in the route list."
    end
  end

  def position
    puts "The train_#{@number} current station is: #{@station}."
  end

  def train_params
    return {type: @type, car_number: @car_number}
  end
end

class RailwayStation
  @@stations_num = 0
  def initialize(name)
    @name = name
    @trains = []
    @@stations_num += 1
    puts "New station (#{@name})!!!"
  end

  def take_train(params = {})
    if params[:type].nil? || params[:car_number].nil?
      puts "Station can not take nonexistent train!"
    else
      @trains << {type: params[:type], car_number: params[:car_number]}
      puts "One more train (type: #{params[:type]}, car number: #{params[:car_number]}) arrived to the #{@name} station."
      puts "Now there are #{@trains.size} trains on the station."
    end
  end

  def trains
    puts "There are total #{@trains.size} trains on the #{@name} station:"
    @trains.each_with_index { |train, index| puts "#{index + 1}. #{train[:type]}, #{train[:cars]} cars"}
  end

  def trains_by_type
    puts "There are total #{@trains.size} trains on the #{@name} station:"
    puts " -- cargo: #{(@trains.select {|train| train[:type] == "cargo"}).size}"
    puts " -- passenger: #{(@trains.select {|train| train[:type] == "passenger"}).size}"
  end

  def send_train(params = {})
    if @trains.include?({ type: params[:type], car_number: params[:car_number] }) 
      @trains.delete({ type: params[:type], car_number: params[:car_number] })
      puts "Train (type: #{params[:type]}, car number: #{params[:car_number]}) leaved the #{@name} station."
      puts "Now there are #{@trains.size} trains on the station."
    else
      puts "No more trains left on the #{@name} station."
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
      puts "New route number #{@number} (route_#{@number}: #{@stations.first} - #{@stations.last}) initialized."
    else
      puts "Sorry, impossible to initialize route without at least to stations."
    end
  end

  def add_station(station)
    @stations.insert(-2, station)
    puts "New station (#{station}) added to the route_#{@number}."
  end

  def del_station(station)
    if @stations.include?(station)
      @stations.delete(station)
      puts "Station #{station} removed from the route_#{@number}."
    else
      puts "Sorry, can't remove the station #{station} from the route_#{@number}, because there is no such station in this route."
    end
  end

  def stations_list
    puts "The route_#{@number} from #{@stations.first} to #{@stations.last} has next stations: "
    @stations.each_with_index{ |station, index| puts "#{index + 1}. #{station}"}
  end

  def stations
    @stations
  end
end
#make new Train instance
puts "Введите поочередно название поезда,тип (1-груз или 2-пасс),кол-во вагонов поезда"

train1 = Train.new("cargo", 22)
train2 = Train.new("pass", 10)

station1 = RailwayStation.new("Park") 
route1 = Route.new(["Park", "Street1", "Street2", "Depo"])