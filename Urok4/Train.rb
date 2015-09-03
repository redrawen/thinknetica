class Train
  #attr_writer:speed
  #attr_reader:speed # геттер  
  attr_accessor :speed # и геттер и сеттер

@@trains_num = 0

  def initialize(name,type,cars) 
    @name = name
    @type = type
    @cars = cars
    @speed = 0
    @route = []
    @@trains_num += 1
    @number = @@trains_num
    puts "---Новый поезд НОМЕР: #{@number} #{name} ТИП: #{@type}, КОЛ-ВО ВАГОНОВ: #{@cars} !!!"
  end

  #def description
  #puts "Поезд: #{name}, тип: #{type}, кол-во вагонов: #{cars}!"
#end

  def accelerate(value)
    @speed += value
    puts "Скорость поезда #{@number} увеличилась на #{value}"
  end

  def current_speed
    puts "Текущая скорость поезда #{@number} = #{@speed}"
  end

  def slow_down(value)
    if @speed == 0
      puts "Поезд #{@number} не движется!"
    elsif @speed > value
      @speed -= value
      puts "Скорость поезда #{@number} уменьшилась на #{value}"
    else
      @speed = 0
      puts "Поезд #{@number} полностью остановился"
    end
  end 

  def cars
    puts "Кол-во вагонов у поезда #{@number} = #{@cars}"
    # Грузовые
    # Пассажирские
  end

  def add_car
    # условие присоединения вагонов по типу 
    if @speed == 0
      @cars += 1
      puts "Вагон прицеплен к поезду #{@number}"
    else
      puts "Невозможно прицепить вагон к движущемуся поезду(train_#{@number})"
    end
  end

  def car_remove
    # условие отсоединения вагонов по типу 
    if @speed == 0
      if @cars > 0
        @cars -= 1
        puts "Вагон отцеплен от поезда #{@number}"
      else
        puts "Нет вагонов для отцепки #{@number}!"
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
    puts "Поезд #{@number} сейчас находится на станции: #{@station}."
  end

  def train_params
    return {type: @type, cars: @cars}
  end
end