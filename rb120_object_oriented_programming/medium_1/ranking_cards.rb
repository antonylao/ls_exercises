class Card
  include Comparable
  attr_reader :rank, :suit
  RANK_VALUES = [nil, nil] + (2..10).to_a + %w(Jack Queen King Ace)
  SUIT_ORDER = %w(Diamonds Clubs Hearts Spades)
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    RANK_VALUES.index(rank)
  end

  def <=>(other)
    if self.rank == other.rank
      SUIT_ORDER.index(self.suit) <=> SUIT_ORDER.index(other.suit)
    else
      self.value <=> other.value
    end
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')
puts

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')
puts

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min#.rank == 4
puts cards.max == Card.new(10, 'Clubs')
puts

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min#.rank == 8
puts cards.max#.rank == 8