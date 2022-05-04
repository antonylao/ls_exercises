require 'pry'

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(string)
    hours, minutes = string.split(':')

  hours = hours.to_i
  minutes = minutes.to_i
  # OR hours, minutes = time_str.split(':').map(&:to_i)

  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end


def before_midnight(string)
  (MINUTES_PER_DAY - after_midnight(string)) % MINUTES_PER_DAY
end


# further exploration
def after_midnight(string)
  hours, minutes = string.split(':').map(&:to_i)
  time = Time.at(0) + (hours * MINUTES_PER_HOUR + minutes)
  time.to_i % MINUTES_PER_DAY
end
p after_midnight('00:00') == 0,
before_midnight('00:00') == 0,
after_midnight('12:34') == 754,
before_midnight('12:34') == 686,
after_midnight('24:00') == 0,
before_midnight('24:00') == 0