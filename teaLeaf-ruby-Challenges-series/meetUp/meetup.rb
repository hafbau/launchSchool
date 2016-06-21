require 'date'

class Meetup

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    week_end = end_of(schedule) and week_start = week_end - 6

    week_start.upto(week_end) do |day|
      current_date = Date.new(@year, @month, day)
      return  current_date if current_date.send(weekday.to_s + '?')
    end
  end

  def end_of(sym_week)
    case sym_week
    when :first then 7
    when :second then 14
    when :teenth then 19
    when :third then 21
    when :fourth then 28
    when :last then Date.new(@year, @month, -1).day
    end
  end

end