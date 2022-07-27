#interesting solution from another LS student: Jesse S
require 'date'

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day, week)
    day = day.downcase
    week = week.downcase

    case week
    when 'first'  then find_date(1, 7, day, week)
    when 'second' then find_date(8, 14, day, week)
    when 'third'  then find_date(15, 21, day, week)
    when 'fourth' then find_date(22, 28, day, week)
    when 'fifth'  then find_date(29, 31, day, week)
    when 'last'   then find_date(22, 31, day, week)
    else find_date(13, 19, day, week)
    end
  end

  private

  def find_date(start_date, end_date, day, week)
    dates = []

    (start_date..end_date).each do |day_num|
      date = Date.new(@year, @month, day_num)
      dates << date if date.send(day + "?")
      rescue ArgumentError # in case month do not have the 31st day (29-31st for february)
    end
    dates.empty? ? nil : dates.last # in case there is no fifth month, return nil
  end
end

# meetup = Meetup.new(2015, 9)
# #assert_equal Date.civil(2015, 9, 29),
# p meetup.day('Tuesday', 'fifth')