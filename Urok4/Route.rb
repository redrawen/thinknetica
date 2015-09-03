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
    puts "Маршрут #{@number} от #{@stations.first} до #{@stations.last} имеет следующую станцию: "
    @stations.each_with_index{ |station, index| puts "#{index + 1}. #{station}"}
  end

  def stations
    @stations
  end
end