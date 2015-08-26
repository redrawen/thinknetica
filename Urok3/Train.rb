class Train
  attr_accessor :speed
  attr_reader   :route, :type, :wagons, :number

  def initialize(number)
    @number = number
    @speed = 0
    @station = 0
    @wagons = []
    @route = []
  end

  def stop
    self.speed = 0
  end

  def stopped?
    self.speed.zero?
  end

  def hitch_wagon(wagon)
    self.wagons << wagon if stopped? && self.type == wagon.type
  end

  def unhook_wagon
    self.wagons.delete_at(-1) if stopped?
  end

  def route!(route)
    self.route = route.stations
  end

  def ride
    unless current_station_last?
      self.station += 1
    else
      puts "Конечная станция"
    end
  end

  def next_station
    self.route[self.station + 1]
  end

  def previous_station
    self.route[self.station - 1]
  end

  def current_station
    self.route[self.station]
  end

  def current_station_last?
    self.current_station == self.route.last
  end

  protected

    attr_accessor :station
    attr_writer   :route, :wagons, :number
end