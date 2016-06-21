class Clock
  attr_reader :time_in_minutes
  
  def initialize(minutes)
    @time_in_minutes = minutes
  end

  def self.at(hour, minute = 0)
    time_in_minutes = (hour == 0 ? 24 : hour) * 60 + minute
    new(time_in_minutes)
  end

  def to_s
    self.format
    '%02d:%02d' % [@hours, @mins]
  end

  def +(minutes)
    Clock.new(@time_in_minutes += minutes)
  end

  def -(minutes)
    self.+(-minutes)
  end

  def ==(other)
    self.time_in_minutes == other.time_in_minutes
  end

  def format
    @hours = (time_in_minutes / 60 > 23) ? 0 : time_in_minutes / 60
    @mins = time_in_minutes % 60
  end
end