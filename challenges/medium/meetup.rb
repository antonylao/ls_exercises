=begin
Meetups are a great way to meet people who share a common interest. Typically, meetups happen monthly on the same day of the week. For example, a meetup's meeting may be set as:

    The first Monday of January 2021
    The third Tuesday of December 2020
    The teenth wednesday of December 2020
    The last Thursday of January 2021

In this program, we'll construct objects that represent a meetup date. Each object takes a month number (1-12) and a year (e.g., 2021). Your object should be able to determine the exact date of the meeting in the specified month and year. For instance, if you ask for the 2nd Wednesday of May 2021, the object should be able to determine that the meetup for that month will occur on the 12th of May, 2021.

The descriptors that may be given are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'. The case of the strings is not important; that is, 'first' and 'fIrSt' are equivalent. Note that "teenth" is a made up word. There was a meetup whose members realised that there are exactly 7 days that end in '-teenth'. Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is the "teenth" of that day in every month. That is, every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc.
The fifth day of the month may not happen every month, but some meetup groups like that irregularity.

The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'. Again, the case of the strings is not important.

problem: construct date object
  input: month (1-12), year
  output: custom date object

  requirements
  validation?
  negative year? doesn't matter

problem: identify the date of the meeting
  input: descriptor('first..fifth', 'last' 'teenth'), day of the week 'monday'..'sunday'
    validation?
    case insensitive for both inputs
  output: corresponding full date
  requirements
    every month has one 'teenth' day (date in string form) for a given day of the week
    which dates (1-31) are teenth? 13-19 (7 days)

    maximum number of a day of the week is 5: last == fifth in this case
    if total number of day of the week is 4: last == fourth
    What if 'fifth' and day_of_the_week appears 4 times only? return nil

    2-3 days of the week appears 5 times in a month => the other 4 to 3 days appear 4 times in a month
    First 2-3 days are the ones that appears 5 times
    (2 or 3 depending if the month has 30 or 31 days)
    How to know how many days a month has ? impair 1, 3.. 7 & pair 8 .. 12 : 31
                                            2: 28 ; pair 4..6 & impair 9..11: 30

    --draft
    1: monday .. 8: monday ..15 .. 22 .. 29
    2: tuesday .. 9 .. 16 .. 23 .. 30
    3: wednesday ... 31
    --draft

E: class Meetup
  instance methods: initialize(year(int), month(integer))
  day(day(str),number(str)) => date object

D: initialize: input: int output: 2 instance var
day: input: day_of_the_week str, numberth integer (conversion needed:) if first..fifth or last, or range of numbers if 'teenth'
  helper: represented_nb

A:initialize: ok
day:
if teenth, find the day corresponding in the range 13..19
else convert the string into the numberth int (helper method), and find the numberth's time the day appear in the month (go through each day of the month)

helper: descriptor_int
input: descriptor (string), month, year
-no verification
-teenth & last not included
output: int

E: June 2022, Wed and Thur => 5 ; other day; 4

D: input: string ; output: int


A: if first..fifth : return 1 - 5


=end

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
    #from LS solution:
    # @days_in_month = Date.civil(@year, @month, -1).day
  end

  def day(day_week, descriptor)
    day_week, descriptor = [day_week, descriptor].map(&:downcase)

    case descriptor
    when 'teenth' then teenth_day(day_week)
    when 'last' then last_day(day_week)
    else numberth_day(day_week, descriptor)
    end
  end

  private

  def wday_method_equiv(str)
    %w(sunday monday tuesday wednesday thursday friday saturday).index(str)
  end

  def descriptor_int(str)
    ['first', 'second', 'third', 'fourth', 'fifth'].index(str) + 1
  end

  def weekday_is?(date, day_week)
    (date.wday) == wday_method_equiv(day_week)
  end

  def teenth_day(day_week)
    (13..19).each do |day_of_month|
      date = Date.new(@year, @month, day_of_month)
      return date if weekday_is?(date, day_week)
    end
  end

  def last_day(day_week)
    current_date = Date.new(@year, @month + 1, 1).prev_day
    loop do
      return current_date if weekday_is?(current_date, day_week)
      current_date -= 1
    end
  end

  def numberth_day(day_week, descriptor)      current_date = Date.new(@year, @month, 1)
    counter = 0
    counter_limit = descriptor_int(descriptor)

    loop do
      counter += 1 if weekday_is?(current_date, day_week)
      return nil if current_date.month != @month
      break if counter == counter_limit
      current_date = current_date.next
    end

    current_date
  end
end