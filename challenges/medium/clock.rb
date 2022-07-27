=begin
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by a given clock object. Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

problem 0:
input: hours, minutes (opt)
verification of input? no
float numbers? ignored
minutes initialized at 0 if not inputted
output: clock obj

problem 1: add or subtract minutes
input: minutes added/removed, time
verification of input? no
negative numbers allowed? or different methods in each case? .+ and .- methods
float numbers allowed? ignored
output: new time
--requirements--
add/remove first minutes/60 (int division), then minutes%60

problem 2: to_s
input: hours, minutes
no float, no verification
output: xx:xx
add 0 if necessary

E: class Clock
class methods: at(int, (int)); +, -; to_s

P: pb0: input: 1 or 2 integers, output : 2 instance var
   pb1: input: int; output: clock obj
   pb2: input: 2 ints; output: str

A: pb0: ok
pb1:
add/remove first minutes/60 (int division) to hours, then minutes % 60 to minutes
if hours is less than 0, add 24 until it is more
if minutes is less than 0
  remove 1 from hours
  add 60 to minutes
  until minutes >= 0 (should only be one time)
pb2:if hours is less than 10, prepend a 0 to the string
if minutes is less than 10, append a 0 after ':'

=end

class Clock
  MINUTES_IN_ONE_HOUR = 60
  HOURS_IN_ONE_DAY = 24
  #for LS
  MINUTES_IN_A_DAY = HOURS_IN_ONE_DAY * MINUTES_IN_ONE_HOUR

  protected

  attr_reader :hours, :minutes

  public

  def initialize(hrs, mins)
    @hours = hrs
    @minutes = mins
    correct_time!
  end

  def self.at(hrs, mins = 0)
    self.new(hrs, mins)
  end

  def +(mins)
    new_hours = hours + (mins / MINUTES_IN_ONE_HOUR)
    new_minutes = minutes + (mins % MINUTES_IN_ONE_HOUR)
    self.class.new(new_hours, new_minutes)
  end

  def -(mins)
    new_hours = hours - (mins / MINUTES_IN_ONE_HOUR)
    new_minutes = minutes - (mins % MINUTES_IN_ONE_HOUR)
    self.class.new(new_hours, new_minutes)
  end

  def to_s
    format("%02d:%02d", hours, minutes)
    # str = ''
    # str << '0' if hours < 10
    # str << hours.to_s

    # str << ':'
    # str << '0' if minutes < 10
    # str << minutes.to_s

    # str
  end

  def ==(other)
    (self.minutes == other.minutes) && (self.hours == other.hours)
  end

  private

  def correct_time!
    #my solution
    # correct_minutes!
    # correct_hours!

    #LS-like solution
    time_in_minutes = hours * 60 + minutes

    until time_in_minutes > 0
      time_in_minutes += MINUTES_IN_A_DAY
    end

    until time_in_minutes < MINUTES_IN_A_DAY
      time_in_minutes -= MINUTES_IN_A_DAY
    end

    @hours, @minutes = time_in_minutes.divmod(MINUTES_IN_ONE_HOUR)
  end

  def correct_minutes!
    until minutes >= 0
      @minutes += MINUTES_IN_ONE_HOUR
      @hours -= 1
    end

    until minutes < MINUTES_IN_ONE_HOUR
      @minutes -= MINUTES_IN_ONE_HOUR
      @hours += 1
    end
  end

  def correct_hours!
    until hours >= 0
      @hours += HOURS_IN_ONE_DAY
    end

    until hours < 24
      @hours -= HOURS_IN_ONE_DAY
    end
  end
end