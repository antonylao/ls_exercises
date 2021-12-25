require 'pry'

def initialize_switches(integer)
  Array.new(integer, :off)
end

def click_switch!(switches, human_index)
  index = human_index - 1
  switches[index] = (switches[index] == :on ? :off : :on)
end

def light_switches_by_multiples!(switches, integer)
  nb_of_switches = switches.size
  multiples = multiples(integer, nb_of_switches)

  multiples.each { |human_index| click_switch!(switches, human_index)}
end

def multiples(integer, limit)
  if integer <= 0
    puts "integer < 0 in multiples"
    return []
  end

  array = []
  1.upto(limit) { |nb| (array << nb) if nb % integer == 0}
  array
end

def indexes_switches_on(switches)
  new_array = []
  switches.each_with_index do |switch, index|
    human_index = index + 1
    new_array << human_index if switch == :on
  end
  new_array
end

def lights_on_pattern(n)
  switches = initialize_switches(n)
  1.upto(n) do |human_index|
    light_switches_by_multiples!(switches, human_index)
    display_lights_on_and_off(switches, human_index)
  end

  #indexes_switches_on(switches)
  display_lights_on_and_off(switches, nil, true)
end

def display_lights_on_and_off(switches, round_nb, last_display = false)
  switches_on = []
  switches_off = []
  switches.each_with_index do |switch, index|
    human_index = index + 1
    switch == :on ? switches_on << human_index : switches_off << human_index
  end

  switches_on_str = joinor(switches_on, ', ', 'and')
  switches_off_str = joinor(switches_off, ', ', 'and')
  nb_of_lights_on = switches_on.size
  unless last_display
    if switches_off.size == 0
      puts "round #{round_nb}: every light is turned on"
    else
      puts "round #{round_nb}: lights #{switches_on_str} are on; lights #{switches_off_str} are off"
    end
  else
    puts "The result is that #{nb_of_lights_on} are left on, lights #{switches_on_str}"
  end
end


def joinor(array, separator = ', ', last_elt_separator = 'or')
  last_separator_full = separator + last_elt_separator
  case array.size
  when 0 then ''
  when 1 then array[0].to_s
  when 2 then array.join(" #{last_elt_separator} ")
  else
    "#{array[0..-2].join(separator)}#{last_separator_full} #{array[-1]}"
  end
end

lights_on_pattern(5)
lights_on_pattern(10)