class RailwayStation
  @@stations_num = 0
  
  def initialize(name)
    @name = name
    @trains = []
    @@stations_num += 1
    puts "--- Cоздана новая станция (#{@name})!!!"
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
    puts " - грузовых: #{(@trains.select {|train| train[:type] == "cargo"}).size}"
    puts " - пассажирских: #{(@trains.select {|train| train[:type] == "pass"}).size}"
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