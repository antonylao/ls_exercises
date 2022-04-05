class Player
  INITIAL_GUESSES = 7
  attr_accessor :remaining_guesses
  attr_accessor :guess

  def initialize
    @remaining_guesses = INITIAL_GUESSES
    @guess = nil
  end
end

class GuessingGame
  GUESS_RANGE = (1..100)

  def initialize
    @nb_to_find = nil
    @player = Player.new
  end

  def set_nb_to_find
    @nb_to_find = GUESS_RANGE.to_a.sample
  end

  def play
    set_nb_to_find
    while @player.remaining_guesses > 0
      play_round
      break if @player.guess == @nb_to_find
      @player.remaining_guesses -= 1
    end
    if @player.guess != @nb_to_find
      puts
      puts "You have no more guesses. You lost!"
    end
  end

  def play_round
    display_remaining_guesses
    input_guess
    display_result
  end

  def display_remaining_guesses
    puts "You have #{@player.remaining_guesses} guesses remaining."
  end

  def input_guess
    guess = nil
    loop do
      print "Enter a number between #{GUESS_RANGE.first} and #{GUESS_RANGE.last}: "
      guess = gets.chomp.to_i
      break if GUESS_RANGE.cover?(guess)
      print "Invalid guess. "
    end

    @player.guess = guess
  end

  def result
    case @player.guess <=> @nb_to_find
    when -1 then :too_low
    when 0 then :found
    when 1 then :too_high
    end
  end

  def display_result
    case result
    when :too_low then puts "Your guess is too low."
    when :found then puts "You found it!"
    when :too_high then puts "Your guess is too high."
    end
  end
end

game = GuessingGame.new
game.play
