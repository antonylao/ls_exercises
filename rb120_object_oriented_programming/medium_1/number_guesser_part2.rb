class GuessingGame
  def initialize(low_nb, high_nb)
    @range = (low_nb..high_nb)
    @remaining_guesses = Math.log2(@range.size).to_i + 1
    @nb_to_find = nil
  end

  def set_nb_to_find
    @nb_to_find = @range.to_a.sample
  end

  def play
    set_nb_to_find
    while @remaining_guesses > 0
      break if play_round == :endgame
      @remaining_guesses -= 1
    end
    puts
    puts "You have no more guesses. You lost!"

  end

  def play_round
    display_remaining_guesses
    int = input_guess
    result_sym = result(int)
    display_result(result_sym)

    return :endgame if result_sym == :found
    nil
  end

  def display_remaining_guesses
    puts "You have #{@remaining_guesses} guesses remaining."
  end

  def input_guess
    loop do
      print "Enter a number between #{@range.first} and #{@range.last}: "
      input_int = gets.chomp.to_i
      return input_int if @range.cover?(input_int)
      print "Invalid guess. "
    end
  end

  def result(int)
    case int <=> @nb_to_find
    when -1 then :too_low
    when 0 then :found
    when 1 then :too_high
    end
  end

  def display_result(sym)
    case sym
    when :too_low then puts "Your guess is too low."
    when :found then puts "You found it!"
    when :too_high then puts "Your guess is too high."
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play
