class CargoTrain < Train

@@cargo_trains_num = 0

  def initialize
  @@cargo_trains_num += 1
  end

  def add_cargo_car
    # условие присоединения вагонов по типу 
    if @speed == 0
      @cars += 1
      puts "пассажирский вагон прицеплен к пассажирскому поезду #{@number}"
    else
      puts "нельзя прицепить вагон к движущемуся поезду(train_#{@number})"
    end
  end

  def car_cargo_remove
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
end
