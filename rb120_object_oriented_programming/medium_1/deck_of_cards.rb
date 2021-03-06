class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @pile = []
    reshuffle
  end


  def draw
    reshuffle if @pile.empty?
    @pile.shift
  end

  private

  def reshuffle
    RANKS.each do |rank|
      SUITS.each do |suit|
        @pile << Card.new(rank, suit)
      end
    end
    #LS Solution
    # @pile = RANKS.product(SUITS).map do |rank, suit|
    #   Card.new(rank, suit)
    # end
    @pile.shuffle!
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit
  RANK_ORDER = (2..10).to_a + %w(Jack Queen King Ace)

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    RANK_ORDER.index(rank) + 2
  end

  def <=>(other)
    self.value <=> other.value
  end
end

# Include Card and Deck classes from the last two exercises.

class PokerHand
  CARDS_IN_HAND = 5
  def initialize(deck)
    @hand = []
    CARDS_IN_HAND.times { @hand << deck.draw }
  end

  def print
    @hand.each {|card| puts card}
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    straight_flush? && @hand.max.rank == 'Ace'
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    hand_ranks = @hand.map(&:rank)
    hand_ranks.each do |card_rank|
      return true if hand_ranks.count(card_rank) == 4
    end

    false
  end

  def full_house?
    hand_ranks = @hand.map(&:rank)
    ranks_uniq = hand_ranks.uniq

    ranks_uniq.size == 2 &&
      ranks_uniq.each {|rank_uniq| [2, 3].include?(hand_ranks.count(rank_uniq)) }
  end

  def flush?
    hand_suits = @hand.map(&:suit)
    hand_suits.uniq.size == 1
  end

  def straight?
    hand_sorted = @hand.sort
    previous_card_value = nil

    hand_sorted.each_with_index do |card, idx|
      unless idx == 0
        return false unless card.value == previous_card_value + 1
      end
      previous_card_value = card.value
    end

    true
  end

  def three_of_a_kind?
    hand_ranks = @hand.map(&:rank)
    hand_ranks.each do |card_rank|
      return true if hand_ranks.count(card_rank) == 3
    end

    false
  end

  def two_pair?
    two_pair_count = 4
    count = 0

    hand_ranks = @hand.map(&:rank)
    hand_ranks.each do |card_rank|
      count += 1 if hand_ranks.count(card_rank) == 2
    end

    count == two_pair_count
  end

  def pair?
    hand_ranks = @hand.map(&:rank)
    hand_ranks.each do |card_rank|
      return true if hand_ranks.count(card_rank) == 2
    end

    false
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])

puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'