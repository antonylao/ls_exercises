def staggered_case(string)
  new_string = ''

  string.each_char.with_index do |char, index|
    if index.even?
      new_string << char.upcase
    else
      new_string << char.downcase
    end
  end

  new_string  #futher exploration: new_string.swapcase
end

#further exploration using LS solution method

def staggered_case(string)
  result = ''
  need_upper = false
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'.swapcase
p staggered_case('ALL_CAPS') == 'AlL_CaPs'.swapcase
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'.swapcase

#part 2
def staggered_case(string, ignore_non_alphabetical = false)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end

    if ignore_non_alphabetical
      need_upper = !need_upper
    else
      need_upper = !need_upper if char =~ /[a-zA-Z]/  # or /[a-z]/i (i stands for ignore case)
    end
  end
  result
end


p staggered_case('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'